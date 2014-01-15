Received: from mail-bk0-x22c.google.com ([2a00:1450:4008:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3UnA-0007UP-PU
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2014 18:02:17 +0000
Received: by mail-bk0-f44.google.com with SMTP id ej10so820446bkb.17
 for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2014 10:01:53 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
In-Reply-To: <CAD6G_RScYO2vLuFP=erKF-+cLcri2WTXm=jFu809VmiGxXAbhg@mail.gmail.com>
References: <CAD6G_RScYO2vLuFP=erKF-+cLcri2WTXm=jFu809VmiGxXAbhg@mail.gmail.com>
Date: Wed, 15 Jan 2014 11:01:53 -0700
Message-ID: <CAPnjgZ1eKU_r2PXg+UxsfLJSGmEpWgLhq4L07xSVR4hFi7Be6Q@mail.gmail.com>
Subject: Re: [U-Boot] sf: Discussion on quad changes
From: Simon Glass <sjg@chromium.org>
To: Jagan Teki <jagannadh.teki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Michal Simek <monstr@monstr.eu>, Gerhard Sittig <gsi@denx.de>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, linux-mtd@lists.infradead.org,
 Rajeshwari Shinde <rajeshwari.s@samsung.com>, Tom Rini <trini@ti.com>,
 Sourav Poddar <sourav.poddar@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jagan,

On 15 January 2014 02:36, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>
> Hi All,
>
> This particular discussion is a next level add-on for thread [1]
>
> State of u-boot now:
> - Added quad changes on u-boot and will be available in coming release.
> - Added commands are
>   1) 1-line # Array slow read, Array fast read(available before)
>   2) 2-line # Dual fast read, Dual IO read
>   3) 3-line # Quad fast read, quad IO read, Quad page program
> - The implementation "will determine the fastest command by taking the supported
>   commands from the flash and the controller, controller is always
> been a priority."
> - Suppose we have a flash that supports all types of commands then from driver
>   side we have an option to set the particular command and the same option will
>   goes to sf and will determine the fastest one.
>   ex: if flash supports all, but the driver supports dual fast then
> the outcome read
>   could be dual fast.
>
> And even Linux will also does the similar implementation, i guess.
> The main reason for going maximum or based on controller setting transfer is to
> improve sf performance.
>
> But from previous thread of discussion - Gerhard Sittig, identified a
> side-effect on this
> implementation as per as board to connected flash perceptive.
>
> The question as per my understanding was "If a controller support 1,
> 2, and 4 lines then
> the BoardA is designed to connect a flash with 4-lines, BoardB is
> designed to connect
> a flash with 2-lines and BoardC is designed to connect a flash with 1-line."
>
> In above scenario - as we have a common controller driver that may set
> an option to support
> quad then BoardB and BoardC will fail to transfer.
>
> Gerhard Sittig, please add if i miss any points here!
>
> I do agree this scenario and I have few possible inputs.
> 1) dynamic - auto-detection:
>     Get the max_nof_lines based on the board to connected flash.
>     So-that we can configure the transfer mode based on the lines.
>     no idea yet, how to get the max_nof_lines dynamically - any inputs.
> 2) static: from user level we may give the max_nof_lines
>     ex: sf probe probe [[[bus:]cs]:max_nof_line] [hz] [mode]
>     If user can't input max_nof_line so-that driver will go with single and
>     the rest case transfer modes assigned based on the given input.
>     for Linux it can be pdata or dts.


I don't have strong opinions on this, but do have a question. How
about board-level configuration? Some boards may use device tree to
indicate which SPI pins / features are available. Perhaps the
configuration could have 'detect' option also. But in many cases I
would expect that the board vendor would know what is supported, and
any 'sf' options should respect that.

>
>
> Request for comments!
>
> [1] http://u-boot.10912.n7.nabble.com/PATCH-v7-01-17-sf-Add-extended-read-commands-support-td171225.html#a171290
>
> --
> Thanks,
> Jagan.


Regards,
Simon

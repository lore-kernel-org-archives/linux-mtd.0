Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R14UV-0005mf-GI
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2011 22:51:40 +0000
Received: by yxk8 with SMTP id 8so3522137yxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 Sep 2011 15:51:38 -0700 (PDT)
Message-ID: <4E66A3F3.2020604@gmail.com>
Date: Wed, 07 Sep 2011 10:51:31 +1200
From: CJ <cjpostor@gmail.com>
MIME-Version: 1.0
To: vignesh rajendran <vickylinuxer@gmail.com>
Subject: Re: UBIFS + device issue
References: <4E65A33F.5030405@gmail.com>
	<CALoDM-HP2Q6zhnGkMCFWp7DfBy+EjTq0Y3aR2Yo_z+8a-FGSCA@mail.gmail.com>
In-Reply-To: <CALoDM-HP2Q6zhnGkMCFWp7DfBy+EjTq0Y3aR2Yo_z+8a-FGSCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/09/11 00:21, vignesh rajendran wrote:
> Hi
>
> I am not getting your problem..Your camera device is not 
> detecting..right..? What kernel version you are using...?
>
> �and check /dev/video0 is there..
>
>
> Regards
>
> Vignesh Rajendran
>
>
>
>
Hi Vignesh,

We are using the latest stable kernel 3.0.4
The camera is being detected.. we have video0 the hardware modules are 
all loading. The only thing not being setup is /dev/media0

The weird thing is that it works when running from SD card with EXT4, 
but not from NAND with UBIFS. There may be another variable that is 
changing - but it is not software or kernel.

Has anyone observed anything like this before?

Cheers,
CJ

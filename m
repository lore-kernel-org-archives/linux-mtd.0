Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYgVf-0004Kf-T9
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 15:35:32 +0000
Received: by vxd3 with SMTP id 3so2838482vxd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Jun 2011 08:35:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307621434.7374.78.camel@localhost>
References: <1307377091.3112.100.camel@localhost>
	<1307389926-12209-1-git-send-email-mlcreech@gmail.com>
	<1307421266.11104.10.camel@localhost>
	<BANLkTikKVMQFxtE0S1VL4-SUPWNydgexLw@mail.gmail.com>
	<1307542265.31223.97.camel@localhost>
	<BANLkTimXGmANdV663BP2CLKZTJyzD+QLhQ@mail.gmail.com>
	<1307621434.7374.78.camel@localhost>
Date: Mon, 20 Jun 2011 11:35:29 -0400
Message-ID: <BANLkTikU-a_L8CmSXad3Ly3KNoqLB1RAhA@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress ...
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 9, 2011 at 8:10 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> With my latest code-base, I am able to inject a hack into
> ubifs_leb_change() - but this function does not exist in your code-base.
> Anyway, I'm currently running power cut emulation testing with the
> following hack:
>

Hi Artem, just wanted to post an update to this:

I hacked this change into my kernel last week, and enabled the
in-kernel debugging options you suggested, then set up a power-cut
test:

- the device in question is powered by a UPS with controllable outlets
- its firmware boots and immediately starts writing large amounts of
data to flash (so we'll have a dirty FS)
- a separate script controlling the UPS waits for the device to boot,
then sleeps some random time between 0 and 10 minutes
- it then cuts power to the outlet and later restores it

The test has been running for the better part of a week with no issues
- it has now power-cycled the device over 1500 times, but I've gotten
no errors, and the filesystem is functioning fine.  FYI this is way
more stress than was placed on the "bad" units we've gotten back from
the field - most of those rarely lose power, and when they do, they're
less likely to be in the middle of a write operation.

I'll continue testing, but based on this it seems like UBIFS handles
power cuts very well!

-- 
Matthew L. Creech

Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PLAbQ-0000Qr-LI
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2010 08:21:21 +0000
Received: by wyf22 with SMTP id 22so433973wyf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Nov 2010 00:21:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTim7TT8ydMiSX8B2ehJP2kQ6jtGSnEZU98AZjWUf@mail.gmail.com>
References: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
	<4CD11C03.3090207@parrot.com>
	<AANLkTimfxjrtV4eks5tK68h6TQ20soib+6gaTC+QyB4a@mail.gmail.com>
	<AANLkTinSj2vAJJjeSxF-rvq08OVsnw3YcpRSpuOfv9pQ@mail.gmail.com>
	<AANLkTikQtNwsPkJSkmpmC=kMZpmdqHDW0HROeUBNDOEi@mail.gmail.com>
	<1289646433.2218.22.camel@localhost>
	<1289649338.2218.42.camel@localhost>
	<AANLkTink+0WvCmQWwd4+Vf8TETjR5-6BsGU=a071Rk0+@mail.gmail.com>
	<AANLkTim7TT8ydMiSX8B2ehJP2kQ6jtGSnEZU98AZjWUf@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 24 Nov 2010 02:50:42 -0500
Message-ID: <AANLkTimHCBNCcc3suXv4kJ4+MXUSf5Tw2r876A7tqtoL@mail.gmail.com>
Subject: Re: Suggested patch: reset errno after isatty()
To: Ketil Froyn <ketil@froyn.name>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 18, 2010 at 06:13, Ketil Froyn wrote:
> On Wed, Nov 17, 2010 at 4:50 PM, Ketil Froyn wrote:
>> I've done some digging around in the new code, but I haven't worked
>> out exactly why the OOB size is set to 0. I haven't figured out
>> exactly what it does yet... Or could it have anything to do with my
>> build environment?
>
> I rebuilt nanddump from v1.4.1 with my patches using the CodeSourcery
> toolchain (I'd been using the AOSP toolchain before). It works fine,
> so I guess that rules out problems in my build environment. Here's
> what the run looks like:
>
> / # nanddump-old -f /sdcard/mtd5.dump /dev/mtd/mtd5
> ECC failed: 0
> ECC corrected: 0
> Number of bad blocks: 0
> Number of bbt blocks: 0
> Block size 131072, page size 2048, OOB size 56
> Dumping data starting at 0x00000000 and ending at 0x0a5c0000...
> / #

so you'll want to dive into the ioctls to see what isnt working right.
 strace is your friend.

> This particular system appears to use MTD partitioning, maybe
> redboot(?) or something like that. I haven't had the opportunity to
> delve into how that works yet - could it be that the partitioning
> takes 8 bytes of the OOB?

no
-mike

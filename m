Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDYdD-000782-Ms
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 08:23:44 +0000
Message-ID: <4CD11C03.3090207@parrot.com>
Date: Wed, 3 Nov 2010 09:23:31 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Ketil Froyn <ketil@froyn.name>
Subject: Re: Suggested patch: reset errno after isatty()
References: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
In-Reply-To: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ketil Froyn a écrit :
> isatty() uses an ioctl and the resulting error code to determine if an
> fd is a tty or not. If it isn't, errno is set to ENOTTY. Later in the
> code, pread() fails, or rather returns 0 immediately. When this
> happens, the following perror("pread") tells me:
> 
> pread: Not a typewriter
> 
> which is the wrong error. Here's strace showing the issue:
> 
> open("/sdcard/mtd5.dump", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 0644) = 4
> ioctl(4, TCGETS or SNDCTL_TMR_TIMEBASE, 0xbee43ab0) = -1 ENOTTY (Not a
> typewriter)
> write(2, "Block size 131072, page size 204"..., 47) = 47
> write(2, "Dumping data starting at 0x00000"..., 64) = 64
> ioctl(3, 0x40084d0b, 0xbee43c30)        = 0
> pread(3, "", 2048, 0)                   = 0
> write(2, "pread", 5)                    = 5
> write(2, ": ", 2)                       = 2
> write(2, "Not a typewriter", 16)        = 16
> write(2, "\n", 1)                       = 1
> 
> And the included patch (below, against v1.4.1, but simple enough)
> should take care of it.
> 
> Though if someone knows what could be causing the pread() to keep
> failing, I'd be interested in hearing it! And the mtd device is
> reported as having a page size of 2048 and oob size 56, so to get even
> this far I added that as a valid page size. Isn't it?
Why errno is checked when pread return 0 ?
Errno should be checked only when return is -1.

man pread :
RETURN VALUE
        On success, the number of bytes read or written is returned 
(zero indi-
        cates  that  nothing  was  written,  in the case of pwrite(), or 
end of
        file, in the case of pread()), or -1 on error, in which case 
errno  is
        set to indicate the error.

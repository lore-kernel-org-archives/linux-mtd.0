Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFVdW-0001o2-TT
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 18:08:23 +0000
Received: by pwi8 with SMTP id 8so1657384pwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Apr 2011 11:08:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <000201cc046b$b03a6310$10af2930$@janteq.com>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
Date: Thu, 28 Apr 2011 20:08:19 +0200
Message-ID: <BANLkTin+yKefqa8bKPnen1fsohevJohO+Q@mail.gmail.com>
Subject: Re: Discovering current MTD partition
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: Umar Qureshey <umar@janteq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27 April 2011 01:43, Umar Qureshey <umar@janteq.com> wrote:
> [...]
> Aside from scanning /proc/cmdline, is there a way to
> programmatically ascertain which mtd partition is active *now*.
> I need to find this information within a Python script but really if it c=
an
> be done in C (perhaps a syscall?), it's all I need.

Busybox has a command called 'rdev' that looks up the block device
that is mounted on /.

$ busybox rdev
/dev/sda1 /

Look in busybox/util-linux/rdev.c and busybox/libbb/find_root_device.c
for the implementation details.

Best regards,
Bj=C3=B8rn Forsman

Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDDnW-0006Gp-8y
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 10:08:59 +0000
Received: by gyb11 with SMTP id 11so4176837gyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Nov 2010 03:08:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093EEF9619@Cloud.RL.local>
References: <AANLkTinNUrQKg_8EgwW5k7BZFiik5ish6-z+qK-=3qpU@mail.gmail.com>
	<70E876B0EA86DD4BAF101844BC814DFE093EEF9619@Cloud.RL.local>
Date: Tue, 2 Nov 2010 11:08:56 +0100
Message-ID: <AANLkTikSjAaNYQ0VTNonziK+j8z9qCcJ+D963U1MQ7HW@mail.gmail.com>
Subject: Re: Cross compiling mtd-utils for Android and pread errors
From: Ketil Froyn <ketil@froyn.name>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 29, 2010 at 3:18 PM, Jon Povey <Jon.Povey@racelogic.co.uk> wrote:
> linux-mtd-bounces@lists.infradead.org wrote:
>> pread: Not a typewriter / #
>>
>> I'm grateful for any tips that can nudge me in the right direction.
>
> "Not a typewriter" is ENOTTY, i.e. ioctl not supported.
>
> Seems your android mtd devices don't support those ioctls.

Hi Jon,

Thanks for the response! I only get ENOTTY when dumping to file, but
not when I try to dump output to a tty using:

/sdcard/nanddump -a /dev/mtd/mtd0

so it almost seems that the program is confused and tries to treat the
output file like a tty when I run with -f.

Ketil

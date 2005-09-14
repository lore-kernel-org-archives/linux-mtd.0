Received: from mail.sysgo.com ([62.8.134.5])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFU8Z-0002c6-W3
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 06:05:19 -0400
Date: Wed, 14 Sep 2005 12:04:48 +0200 (CEST)
From: Marius Groeger <mgroeger@sysgo.com>
Sender: mag@sysgo.com
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050914092634.GB22847@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.63.0509141136040.12001@mag.sysgo.com>
References: <005e01c5b882$9b318420$0100000a@LuCyFir3>
	<20050913230631.GB29579@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0509140900250.18636@mag.sysgo.com>
	<20050914092634.GB22847@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: =?iso-8859-1?Q?S=E9bastien?= Couret <sebastiencouret@aol.com>,
	linux-mtd@lists.infradead.org
Subject: Re: Silent GCC4.0 warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 Sep 2005, J=F6rn Engel wrote:

>>> Arithmetic with void* pointers is one of the best gcc extensions.  Use
>>> it!  The above is obviously correct, while below makes my brain rotate
>>> around itself at dangerous speed.
>>
>> If I get to choose between portable code and some remote developers
>> brain rotation, I'll pick the portable code. :-)
>
> It's a good thing that we both agree on this.  :)
>
> Is anyone actually using JFFS2 with a non-gcc compiler?  Intel's
> compiler counts as gcc-compatible here, they included all gcc
> extensions used in the kernel, for obvious reasons.

I know I'm quite religous here, and my point isn't really who's using
something else than GCC today -- I grant you that this is quite unlikely.
Experience shows however that you never know in what context you will have
to reuse a specific piece of software, so if your write it portable in the
first place, you're always safe.

Regards,
Marius

--=20
Marius Groeger <mgroeger@sysgo.com>
SYSGO AG                      Embedded and Real-Time Software
Voice: +49 6136 9948 0                  FAX: +49 6136 9948 10
www.sysgo.com | www.elinos.com | www.osek.de | www.pikeos.com

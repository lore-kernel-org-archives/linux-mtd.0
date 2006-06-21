Received: from nf-out-0910.google.com ([64.233.182.188])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ft2wf-00074a-86
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 09:40:51 -0400
Received: by nf-out-0910.google.com with SMTP id p48so96544nfa
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Jun 2006 06:40:33 -0700 (PDT)
Message-ID: <625fc13d0606210640i5a548820lcefd0e74d08cf37c@mail.gmail.com>
Date: Wed, 21 Jun 2006 08:40:32 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: haver@vnet.ibm.com
Subject: Re: [UBI] Remove autotools from ubi-utils
In-Reply-To: <1150893827.6049.4.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <625fc13d0606142102j46277f81gf45a6bf784dc6c90@mail.gmail.com>
	<1150893827.6049.4.camel@localhost.localdomain>
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/21/06, Frank Haverkamp <haver@vnet.ibm.com> wrote:
> Hi,
>

Don't top post.  You'll make the email police angry ;)

> I removed automake and autoconf. libubi is in this version no real
> library anymore. We can change that later on. Artem said, that he
> wanted to improve/rewrite the library anyhow. Now he can do without
> using automake, autoconf. ubiwritevol is now renamed to ubiupdatevol.
>
> http://git.infradead.org/?p=users/haver/mtd-utils.git;a=commit;h=a985bce4176b201d10d22036ea6b5f6d0f539e70

That looks much better.  A simple patch is needed to get things
compiling completely for me.  The ubi-header.h file in mtd-utils
should use the userspace swab functions.  I added 64-bit ones to the
master mtd-utils repo and merged that into my local 'haver' branch.
See:

http://git.infradead.org/?p=users/jwboyer/mtd-utils;a=shortlog;h=haver

josh

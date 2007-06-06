Received: from an-out-0708.google.com ([209.85.132.242])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvvuQ-0005CD-8D
	for linux-mtd@lists.infradead.org; Wed, 06 Jun 2007 09:50:47 -0400
Received: by an-out-0708.google.com with SMTP id c3so30469ana
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jun 2007 06:50:45 -0700 (PDT)
Message-ID: <fe810cf0706060650p48df811dw9f1dd90b2b9f145d@mail.gmail.com>
Date: Wed, 6 Jun 2007 17:50:44 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@lazybastard.org>
Subject: Re: LogFS take four
In-Reply-To: <20070603183845.GA8952@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20070603183845.GA8952@lazybastard.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/3/07, J=F6rn Engel <joern@lazybastard.org> wrote:
> This round the patch is split into file-sized hunks.  There actually
> seem to be kernel developers not manly enough to digest 6000+ lines of
> code at once.  An I thought I was the only wimp around.
>
> [...]

Small question about compr.c. Sorry not posting in proper thread -
just have no original message to reply to.

Why do you use __exit macros with logfs_compr_exit()? You will get an
build-time error if logfs is compiled as part of the kernel (not
module) just because logfs_init() calls logfs_compr_exit().

Thanks,
Alexander

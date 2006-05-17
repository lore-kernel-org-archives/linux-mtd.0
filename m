Received: from ug-out-1314.google.com ([66.249.92.173])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FgJUM-00009p-JE
	for linux-mtd@lists.infradead.org; Wed, 17 May 2006 06:42:57 -0400
Received: by ug-out-1314.google.com with SMTP id q2so184394uge
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 May 2006 03:42:42 -0700 (PDT)
Message-ID: <625fc13d0605170342s1dc0411reb3b7d96421ebd4e@mail.gmail.com>
Date: Wed, 17 May 2006 05:42:41 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060517091038.GA22457@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20060517051201.33135.qmail@web37904.mail.mud.yahoo.com>
	<20060517062552.78956.qmail@web37909.mail.mud.yahoo.com>
	<20060517091038.GA22457@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org, syed khader <sk.syed@yahoo.com>
Subject: Re: zlib compression is failing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/17/06, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
>
> Quite interesting, though, are the sizes.  68 bytes is exactly a jffs2
> inode header.  It makes me a bit uneasy if that cannot be compressed.

Why?  JFFS2 doesn't store the node headers compressed.  It shouldn't
even be trying to compress them.

josh

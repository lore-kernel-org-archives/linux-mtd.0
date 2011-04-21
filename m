Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCtqR-00020h-Pt
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 13:22:56 +0000
Received: by ewy3 with SMTP id 3so571885ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Apr 2011 06:22:53 -0700 (PDT)
Subject: Re: read_pnode: error -22 reading pnode at XX:YYYYY
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rick Johnson <rick22@wi.rr.com>
In-Reply-To: <4DADF9E6.9010709@wi.rr.com>
References: <4DADF9E6.9010709@wi.rr.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 21 Apr 2011 16:20:01 +0300
Message-ID: <1303392001.2757.16.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-19 at 16:08 -0500, Rick Johnson wrote:
> Hi,
> 
> We've been seeing this error
> 
> "read_pnode: error -22 reading pnode at XX:YYYYY"

Hi, I'm very busy now, but here is a quick hint. It looks like a bug. Do
you do unclean power cuts? It might be a bug in the bits manipulation
functions. In short - a penode describes amount of free and dirty space
in one LEB. We try to store this information as compactly as possible,
so we jam it into bits.

There is a 'ubifs_pack_pnode()' function which is used to jam the
free/dirty information into bits. Try to instrument it with and:

1. Validate the pnode before packing, do the same validate_pnode() does.
May be you'll catch the place where it we write incorrect pnode. Because
what you see is a result of an error which might have happend long
before you hit it.

2. At the end of 'ubifs_pack_pnode()' unpack it and validate again, and
make sure it did not change. May be there is a bug in packing/unpacking
functions, then you will catch this.

I'll try to come up with a patch which does this every time we have
debugging enabled, but not now, no time.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

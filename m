Received: from wa-out-1112.google.com ([209.85.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LXkb9-0000Ps-2v
	for linux-mtd@lists.infradead.org; Thu, 12 Feb 2009 23:04:01 +0000
Received: by wa-out-1112.google.com with SMTP id j4so483007wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Feb 2009 15:03:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1234427114.17790.139.camel@localhost.localdomain>
References: <a5e2b64d0902042249k1c5ba5a3qce9d2f68f0523827@mail.gmail.com>
	<1233826226.17790.9.camel@localhost.localdomain>
	<a5e2b64d0902051521p146eef06lc2076b290f924b62@mail.gmail.com>
	<1233905992.17790.19.camel@localhost.localdomain>
	<a5e2b64d0902112248x6fa8b0f2w65ee131086e87bfd@mail.gmail.com>
	<1234427114.17790.139.camel@localhost.localdomain>
Date: Fri, 13 Feb 2009 08:03:57 +0900
Message-ID: <a5e2b64d0902121503r78c4cf6eg6323ffe94f7fa8ca@mail.gmail.com>
Subject: Re: Issues with UBIFS xattr support
From: Tim <timasyk@gmail.com>
To: dedekind@infradead.org, mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/2/12 Artem Bityutskiy <dedekind@infradead.org>:
> On Thu, 2009-02-12 at 15:48 +0900, Tim wrote:
>> > And the "security." namespace seems to be supported. Although
>> > it might be not fully supported. I mean, I tested reading, writing,
>> > changing xattrs - this works. But some security namespace-specific
>> > things might be missing.
I have another question regarding xattr.
If I create new ubifs filesystem image using mkfs.ubifs, does this
utility read xattrs of original files and include them into the image?
I'm especially interested in "security." namespace.

Tim

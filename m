Received: from law14-oe49.law14.hotmail.com ([64.4.20.21] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VnjT-00028v-4a
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jun 2003 08:33:19 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Wed, 25 Jun 2003 19:55:42 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE49BCUcoYhpl00054291@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: blkmem.c questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI folks,

I am working on uCdimm.
On trying to mount jffs2 , I get a message ,

"arena open of 1 failed"
Now this message is in blkmem.c
It comes when Minor number ( here 1) is < 0 or >= arenas
arenas = sizeof(arena)/sizeof(arena_t)
Now For uCdimm, blkmem defines CAT_ROMARRAY.
at if CAT_ROMARRAY is define arena[] is initialzed to
{ 0, 0 , -1}
And I don't think any other  #if defined is true for uCdimm config in
intialization of arena[].

So I have only one arena.
How do I make more that one arena?.
Is arena and Number of partitions and number of Arena related ( they apear
to be so now.) ?
I make two partions. One for first 2MB and one of second 2MB.
Is that right?
I can have as many partitions As i want as long as I keep every partition
more than 5 sections long.. Am I right.?
So Do I have do make as many arena to .

2.) If I keep one partition (mtd0) and erase mtd0, will not my booltloader
be erased too


Please Help me here

Vikram

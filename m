Received: from nf-out-0910.google.com ([64.233.182.188])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HOq5C-0001VL-5Y
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 01:57:07 -0500
Received: by nf-out-0910.google.com with SMTP id a4so74768nfc
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 Mar 2007 22:57:03 -0800 (PST)
Message-ID: <49eab5c80703062257m7b26d09cha8c996aa2c8d5e07@mail.gmail.com>
Date: Wed, 7 Mar 2007 14:57:02 +0800
From: "falls huang" <falls.huang@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Does mtd support two-plane page program for nand flash?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

    AFAIK , the samsung's nand flash K9LAG08U0M/K9HBG08U1M/K9MCG08U5M
support two-plane page program. For example: The K9LAG08U0M is
arranged in four 4Gb memory planes.Each plane contains 2,048 blocks
and 2112 byte page registers. This allows it to perform simultaneous
page program and block erase by selecting one page or block from each
plane. ( refer to the datasheet of K9LAG08U0M)

  I have searched the source of mtd/jffs2/jffs3 and I found that them
don't support two-plane page program . How should I add two-plane page
program ? Should I modify the source of mtd or jffs2/jffs3 ?

  Thanks in advance!


-- 
Regards
Falls Huang

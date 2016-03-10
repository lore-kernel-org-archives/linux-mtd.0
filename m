Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ae5pG-00039k-Jj
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 19:00:48 +0000
Received: by mail-pf0-x22f.google.com with SMTP id 124so75717974pfg.0
 for <linux-mtd@lists.infradead.org>; Thu, 10 Mar 2016 11:00:26 -0800 (PST)
Date: Thu, 10 Mar 2016 11:00:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: checkpatch.pl false positive: FSF mailing address
Message-ID: <20160310190023.GB2545@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joe,

I found this false positive amusing:

$ curl http://patchwork.ozlabs.org/patch/577786/mbox/ | scripts/checkpatch.pl -
[...]
ERROR: Do not include the paragraph about writing to the Free Software
Foundation's mailing address from the sample GPL notice. The FSF has
changed addresses in the past, and may do so again. Linux already
includes a copy of the GPL.
#1489: FILE: drivers/mtd/nand/qcom_nandc.c:1335:
+^I^I * write to the free oob area.$
[...]

The patch is:
  http://patchwork.ozlabs.org/patch/577786/
  [PATCH v8,2/3] mtd: nand: Qualcomm NAND controller driver

and the comment text is:

  "For the last codeword, we skip the bbm positions and write to the
  free oob area."

which matches on this:

# Check for FSF mailing addresses.
                if ($rawline =~ /\bwrite to the Free/i ||

I'm just writing as recommended by the closing text of your tool.

Regards,
Brian

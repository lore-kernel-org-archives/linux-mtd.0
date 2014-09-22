Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW5pA-0003qQ-V3
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 15:46:50 +0000
Received: from [192.168.22.77] (unknown [82.166.146.90])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPSA id 8561C440BCA
 for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2014 18:46:24 +0300 (IDT)
Date: Mon, 22 Sep 2014 18:47:16 +0300 (IDT)
From: Jonathan Ben Avraham <yba@tkos.co.il>
To: linux-mtd@lists.infradead.org
Subject: Question: Why not build libmtd as shared object?
Message-ID: <alpine.DEB.2.02.1409221836340.5333@tavas.tkos.co.il>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear colleagues,
In order to do MTD operations in-process rather than forking a shell to 
run an mdt-utils command line utility, I am using my own functions written 
on top of libmtd. Is there any reason then not to build and install libmtd 
as a shared object? Is there a specific reason that the command line 
utils are statically linked?
Best regards,

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba@tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm

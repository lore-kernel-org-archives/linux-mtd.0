Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13KKLd-0006HQ-00
	for mtd-list@infradead.org; Thu, 03 Aug 2000 13:43:41 +0100
Received: from mx0.i-way.net.uk ([212.49.192.2] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13KKLc-0006HK-00
	for mtd@infradead.org; Thu, 03 Aug 2000 13:43:40 +0100
Received: from m4exch.m4data.co.uk (host2.m4data.co.uk [212.49.209.214] (may be forged))
	by mx0.i-way.net.uk (8.9.3/8.9.3) with ESMTP id MAA03046
	for <mtd@infradead.org>; Thu, 3 Aug 2000 12:43:35 +0100
Message-ID: <00B4D286538DD311BC6E005004E9EFC729B786@M4EXCH>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: "MTD (E-mail)" <mtd@infradead.org>
Subject: Erase broken in latest cfi_cmdset_0002.c
Date: Thu, 3 Aug 2000 13:43:35 +0100 
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01BFFD48.72F92FE0"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01BFFD48.72F92FE0
Content-Type: text/plain;
	charset="iso-8859-1"

The latest cfi_cmdset_0002.c from CVS has broken the erase function.
Here is a diff that I believe fixes it:
(It also includes a fix for the suspend function, as David did for
cfi_cmdset_0001.c on 26/7/00)

 <<cfi_cmdset_0002.c.diff.gz>> 

========================================================
Simon Munton	simonm@m4data.co.uk
M4 Data Ltd	Tel: 44-1749-683800
Mendip Court, Bath Rd, Wells	Fax: 44-1749-673928
Somerset, BA5 3DG, England



------_=_NextPart_000_01BFFD48.72F92FE0
Content-Type: application/octet-stream;
	name="cfi_cmdset_0002.c.diff.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="cfi_cmdset_0002.c.diff.gz"

H4sICDRliTkAC2NmaV9jbWRzZXRfMDAwMi5jLmRpZmYArZRtT9swEMdfp5/i9gbSpqGh0DVrVdRq
hFEJGAOqTUxTZGK39Zo4neP0YYjvvrNTGGUrbNOaSGns8+/ufw9xXReiIQ+jhGZMhZ7n1Xci62qc
Qy8fAeyB57cafsvzoY57JcdxoDZOE1bLeJKKWqJobcKkYHHtWcpuvbW/16o3C0q3C25j36++Bkc/
mtDtlsDKRcZHglHgQkGmiMqz9uPlOBUjUDxhKXTgKx8OOcvAgeNrbZUpmUfKSJlKPiOKQQVf0DIh
U/dgGFM5MzvtkrPuSdJlmJBsoimHwduT3kUQfuz1rz4MgkFgzwlXVYhyKZlQZbQpAUim5LJVqGi+
qe76KMP3qnWv0EESGmZMUJ0N21vgDniLRqOBmDHHWFCaRCbGVdXxugcYBZMxIzO2WqBsxiMWquWU
aZdPib3e/yZqlLeoa/C/Ed01YkgUQvdQOKHSeZFY1jXZeH7jGbDw/rUf7OPrSt0rSmVlUy7CXMRp
NAlvxnYRSpIrtjCALBozmscoQ2NyhWeLdX3s94ccC+/7nkHHuuNuch4/LvemgJFcq8BR/9NpsAOD
jAEx/SxBpZh3Fk1AjXmGqgXVTZZLATxJGOXYzvFyByq1gvBeRAxNmZkShu4wRMG2M5iIdC407YbB
PJUTjhPT345joCnaE2UIWKz5mMcMbH0Vg4ZCdAEkIzSckdi+z3u5DFugRRUXlOFVZ/39FtPxd7iH
5BnYo7dbVGdpAI/MZH7veEXSLD4E+6GNUDGeOzoJg4veZf/snT6oZ7Hp71d38ZPS9Jt6JvUsFuka
mPqbhGlIBmREuLjPxTCVYHPXbQOHA/QI+F8jXcvS1ihly5TSHP3Mv+gW0PFggYx6wJ+1keJYGzHa
+fOd9uw2OtWAp6npmNScn4aXg8vz4OwwOFyJsdasVnOextQstI3FnExYmE/trWJz/m0VxZ/50JYv
ODEmm7zc/VS8eWLRyn3R6K74NqxGCB/t0g+syynj6AYAAA==

------_=_NextPart_000_01BFFD48.72F92FE0--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

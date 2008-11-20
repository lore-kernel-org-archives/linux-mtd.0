Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L3ANJ-0006Yz-SC
	for linux-mtd@lists.infradead.org; Thu, 20 Nov 2008 14:19:18 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KAM00AHSYFYCC@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 20 Nov 2008 23:19:11 +0900 (KST)
Received: from brijeshs ([107.108.214.195])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KAM00ENBYFXUQ@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 20 Nov 2008 23:19:11 +0900 (KST)
Date: Thu, 20 Nov 2008 19:52:31 +0530
From: Brijesh Singh <brij.singh@samsung.com>
Subject: [PATCH] UBIFS: Fix Bulk read buf_len  intialization
To: dedekind@infradead.org
Message-id: <919AC938BD8D49A68F2667677F5034D1@sisodomain.com>
MIME-version: 1.0
Content-type: multipart/alternative;
	boundary="Boundary_(ID_1epS+1/uRYW+cgHooLLMaw)"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

--Boundary_(ID_1epS+1/uRYW+cgHooLLMaw)
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT

In function bu_init in super.c, after buffer allocation, initialization of buf_len parameter is not done. So buf_len=0;

This causes bulk_read to be skipped in all cases.

Here is the scenario:
ubifs_do_bulk_read() {
...
       err  = ubifs_tnc_get_bu_keys() ;
        if (err)
 	goto out_warn;
...
out_warn:
            ubifs_warn("ignoring error %d and skipping bulk-read", err);
            goto out_free;
}

And function:

ubifs_tnc_get_bu_keys() {
                                    ...
                            if (len > bu->buf_len) {
        			err = -EINVAL;
    			goto out;
                           }
...
}

ubifs_tnc_get_bu_keys()  returns error -EINVAL to ubifs_do_bulk_read. So it decides to skip this bulk_read.
 This condition holds forever as mutex will always be free in this case.

The following patch does the initialization....

------------------------------------------------------------------------------------------------------------------------------

diff -urN ubifs-2.6.orig/fs/ubifs/super.c ubifs-2.6/fs/ubifs/super.c
--- ubifs-2.6.orig/fs/ubifs/super.c 2008-11-21 00:33:25.000000000 +0530
+++ ubifs-2.6/fs/ubifs/super.c 2008-11-21 00:36:27.000000000 +0530
@@ -1046,6 +1046,7 @@
   c->bulk_read = 0;
   return;
  }
+ c->bu.buf_len = c->max_bu_buf_len;
 }
 
 /**

--Boundary_(ID_1epS+1/uRYW+cgHooLLMaw)
Content-type: text/html; charset=iso-8859-1
Content-transfer-encoding: 7BIT

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="MSHTML 6.00.6000.16735" name=GENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=#ffffff>
<DIV><FONT face=Arial size=2>In function bu_init in super.c, after buffer 
allocation, initialization of buf_len parameter is not done. So 
buf_len=0;</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>This causes bulk_read to be skipped in all 
cases.</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>Here is the scenario:</FONT></DIV>
<DIV><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">ubifs_do_bulk_read() 
{</SPAN></DIV>
<DIV><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">...</SPAN></DIV>
<DIV><FONT face=Arial size=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;err&nbsp; 
=&nbsp;</FONT><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><FONT 
face="Times New Roman">ubifs_tnc_get_bu_keys() ;</FONT></SPAN></FONT></DIV>
<DIV><FONT size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">if 
(err)</SPAN></SPAN></FONT></DIV>
<DIV><FONT size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">&nbsp;	goto 
out_warn;</SPAN></SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">...</SPAN></SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">out_warn:</SPAN></SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp; </SPAN></SPAN></FONT><FONT face=Arial size=2><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">ubifs_warn("ignoring 
error %d and skipping bulk-read", 
err);<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto 
out_free;</SPAN></SPAN></SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">}</SPAN></SPAN></SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"></SPAN></SPAN></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">And 
function:</SPAN></SPAN></SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"></SPAN></SPAN></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><FONT 
face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><FONT 
face="Times New Roman">ubifs_tnc_get_bu_keys() 
{</FONT></SPAN></FONT></DIV></SPAN></SPAN></SPAN></FONT>
<DIV><FONT size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
...</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"></SPAN></FONT><FONT 
face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if (len &gt; bu-&gt;buf_len) 
{<BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 			err = 
-EINVAL;<BR>&nbsp;&nbsp;&nbsp; 			goto 
out;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
}</SPAN></SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">...</SPAN></SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">}</SPAN></SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"></SPAN></SPAN></FONT><FONT 
face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"></SPAN></SPAN></FONT><FONT 
face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><FONT 
face=Arial size=2></FONT></SPAN></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><FONT 
face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><FONT 
face="Times New Roman">ubifs_tnc_get_bu_keys()&nbsp; 
</FONT></SPAN></FONT></SPAN></SPAN></SPAN></SPAN></SPAN></FONT><FONT face=Arial 
size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 12px -webkit-monospace; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: pre; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><SPAN 
class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"><FONT 
face=Arial size=2>returns error -EINVAL to </FONT></SPAN></SPAN></FONT><FONT 
face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">ubifs_do_bulk_read. 
So&nbsp;it decides to skip this&nbsp;bulk_read.</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">&nbsp;This 
condition holds forever as mutex will always be free in this 
case.</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">The 
following&nbsp;patch does the initialization....</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">------------------------------------------------------------------------------------------------------------------------------</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">diff 
-urN ubifs-2.6.orig/fs/ubifs/super.c ubifs-2.6/fs/ubifs/super.c<BR>--- 
ubifs-2.6.orig/fs/ubifs/super.c&nbsp;2008-11-21 00:33:25.000000000 +0530<BR>+++ 
ubifs-2.6/fs/ubifs/super.c&nbsp;2008-11-21 00:36:27.000000000 +0530<BR>@@ 
-1046,6 +1046,7 @@<BR>&nbsp;&nbsp;&nbsp;c-&gt;bulk_read = 
0;<BR>&nbsp;&nbsp;&nbsp;return;<BR>&nbsp;&nbsp;}<BR>+&nbsp;c-&gt;bu.buf_len = 
c-&gt;max_bu_buf_len;<BR>&nbsp;}<BR>&nbsp;<BR>&nbsp;/**</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"></SPAN></FONT><FONT 
face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"></SPAN></FONT><FONT 
face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"></SPAN></FONT><FONT 
face=Arial size=2><SPAN class=Apple-style-span 
style="WORD-SPACING: 0px; FONT: 16px 'times new roman'; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0"></SPAN></FONT>&nbsp;</DIV></BODY></HTML>

--Boundary_(ID_1epS+1/uRYW+cgHooLLMaw)--

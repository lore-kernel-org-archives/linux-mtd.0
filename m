Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ijSZ-0001qy-00
	for mtd-list@infradead.org; Mon, 09 Oct 2000 21:23:43 +0100
Received: from match.iserver.net ([192.41.38.20])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ijSV-0001qs-00
	for mtd@infradead.org; Mon, 09 Oct 2000 21:23:39 +0100
From: "Dave Wilson" <dlwilson@crossmatch.net>
To: <mtd@infradead.org>
Subject: compile difficulty, infradead ftp server not responding
Date: Mon, 9 Oct 2000 16:19:10 -0400
Message-ID: <NGEOJGOCFAFNCNKEIJMLGEBLCAAA.dlwilson@crossmatch.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0006_01C0320C.A7EDCDB0"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0006_01C0320C.A7EDCDB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

I'm new to the list and to mtd.  I've been tasked with investigating mtd and
ntfl as a
replacement to using the M-Systems DOC binary driver module.  We are having
problems with the DOC becoming corrupted, to the point where we must boot
DOS
and run the DOC format command to recover.  To avoid having to boot DOS for
recovery we would like to be able to use ntfl_format to reformat from Linux.
We are
using SuSE kernel 2.2.5.

The infraread ftp server is not responding, so I pulled the latest CVS
source and
tried to compile.  I got lots of errors, many involving mtd_table_mutex and
DECLARE_MUTEX.  I hacked for a while, but eventually stopped because it
seems
like the code should compile a lot more easily based on what I have read in
the
mailing list archives.  Does the tarball provide compiled modules?  Should
the CVS
source compile as-is?  Will the infradead ftp server be up any time soon so
I can
find out by myself?

thanks,
Dave Wilson

------=_NextPart_000_0006_01C0320C.A7EDCDB0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2920.0" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D736580520-09102000>Hi,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D736580520-09102000></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D736580520-09102000>I'm =
new to the list=20
and to mtd.&nbsp; I've been tasked with investigating mtd and ntfl as=20
a</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D736580520-09102000>replacement=20
</SPAN></FONT><FONT face=3DArial size=3D2><SPAN =
class=3D736580520-09102000>to using=20
the M-Systems DOC binary driver module.&nbsp; We are =
having</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D736580520-09102000>problems with the=20
DOC becoming </SPAN></FONT><FONT face=3DArial size=3D2><SPAN=20
class=3D736580520-09102000>corrupted, to the point where we must boot=20
DOS</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D736580520-09102000>and =
run the DOC=20
format command to recover.&nbsp; To </SPAN></FONT><FONT face=3DArial =
size=3D2><SPAN=20
class=3D736580520-09102000>avoid&nbsp;having to boot DOS =
for</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D736580520-09102000>recovery we would=20
like to be able to use ntfl_format to reformat from Linux.&nbsp; We=20
are</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D736580520-09102000>using =
SuSE kernel=20
2.2.5.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D736580520-09102000></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D736580520-09102000>The =
infraread ftp=20
server is not responding, so I pulled the latest CVS source=20
and</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D736580520-09102000>tried =
to=20
compile.&nbsp; I got lots of errors, many involving mtd_table_mutex=20
and</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D736580520-09102000>DECLARE_MUTEX.&nbsp;=20
I hacked for a while, but eventually stopped because it=20
seems</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D736580520-09102000>like =
the code should=20
compile a lot more easily based on what I have read in =
the</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D736580520-09102000>mailing list=20
archives.&nbsp; Does the tarball provide compiled modules?&nbsp; Should =
the=20
CVS</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D736580520-09102000>source =
compile=20
as-is?&nbsp; Will the infradead ftp server be up any time soon so I=20
can</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D736580520-09102000>find =
out by=20
myself?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D736580520-09102000></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D736580520-09102000>thanks,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D736580520-09102000>Dave=20
Wilson</SPAN></FONT></DIV></BODY></HTML>

------=_NextPart_000_0006_01C0320C.A7EDCDB0--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

Received: from [61.152.162.159] (helo=ms.usish.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FKVSX-0003pc-KP
	for linux-mtd@lists.infradead.org; Sat, 18 Mar 2006 02:02:52 -0500
Received: from inbound.usish.com (inbound.usish.com [192.168.40.102])
	by ms.usish.com (8.12.11/8.12.11) with ESMTP id k2I71agv023039
	for <linux-mtd@lists.infradead.org>; Sat, 18 Mar 2006 15:01:36 +0800
Received: from inbound.usish.com (localhost.localdomain [127.0.0.1])
	by inbound.usish.com (8.12.11/8.12.11) with ESMTP id k2I6wQhq016900
	for <linux-mtd@lists.infradead.org>; Sat, 18 Mar 2006 14:58:26 +0800
Received: from IT0010600 ([218.79.184.197]) (authenticated bits=0)
	by inbound.usish.com (8.12.11/8.12.11) with ESMTP id k2I6wJdp016883
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-mtd@lists.infradead.org>; Sat, 18 Mar 2006 14:58:24 +0800
From: "Jason Chen" <jason_chen@usish.com>
To: <linux-mtd@lists.infradead.org>
Message-ID: <001201c64a59$e805b230$6601a8c0@IT0010600>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0013_01C64A9C.F628F230"
Subject: CFI 1.4 intel cmdset in linux-2.4.21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Sat, 18 Mar 2006 07:02:53 -0000

This is a multi-part message in MIME format.

------=_NextPart_000_0013_01C64A9C.F628F230
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi, all,

I am trying to use cfi 1.4 in linux-2.4.21(use Intel P30 strata flash), as I
find in datasheet, Intel extended query structure is almost the same in CFI
1.3 & 1.4. 

So I just modified some code about CFI MinorVersion's judgement in
cfi_cmdset_0001.c and cfi_cmdset_0001.h:

 

I got CFI_QUERY_SIZE as 36, and I can read the MajorVersion, MinorVersion
etc in the query, but the number of device hard-partition always read as
zero.

 

What happened? What should I do to solve this issue?

 

in cfi_cmdset_0001.h:

..

#define CFI_READ_QUERY(map, base, adr, extp, size) \

do {  \

         struct cfi_private *__cfi = map->fldrv_priv; \

         int __ofs_factor = __cfi->interleave * __cfi->device_type; \

         int __i; \

         for (__i=0; __i<(size); __i++)  \

                   ((unsigned char*)(extp))[__i] =  \

                            cfi_read_query(map,
(base+(((adr)+__i)*__ofs_factor))); \

}while(0); 

 

#define CFI_QUERY_SIZE(map, base, adr) ({ \

         struct cfi_private *__cfi = map->fldrv_priv; \

         int __ofs_factor = __cfi->interleave * __cfi->device_type; \

         struct cfi_pri_intelext __ext; \

         struct cfi_intelext_regioninfo __rinfo; \

         int __ofs = 0, __num_r, __ri; \

         CFI_READ_QUERY(map, base, adr, (&__ext), sizeof(__ext)); \

         __ofs += sizeof(__ext); \

         if (__ext.MajorVersion == '1' && ((__ext.MinorVersion == '3') ||
(__ext.MinorVersion == '4'))) { \

                   __ofs += (__ext.NumProtectionFields - 1) * (sizeof(__u32)
+ 6); \

                   __ofs += 6; \

                   __num_r = cfi_read_query(map, (base +
((adr+__ofs)*__ofs_factor))); \

                   __ofs ++; \

                   for (__ri=0; __ri < __num_r; __ri++) { \

                            CFI_READ_QUERY(map, base, adr+__ofs, (&__rinfo),
sizeof(__rinfo)); \

                            __ofs += sizeof(__rinfo); \

                            __ofs += (__rinfo.NumBlockTypes - 1) *
sizeof(struct cfi_intelext_blockinfo); \

                   } \

         } \

         __ofs; \

})

..

 

 


------=_NextPart_000_0013_01C64A9C.F628F230
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"chsdate"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"chmetcnv"/>
<!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:&#23435;&#20307;;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@&#23435;&#20307;";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
 /* Page Definitions */
 @page Section1
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
	layout-grid:15.6pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DZH-CN link=3Dblue vlink=3Dpurple =
style=3D'text-justify-trim:punctuation'>

<div class=3DSection1 style=3D'layout-grid:15.6pt'>

<p class=3DMsoNormal style=3D'layout-grid-mode:char'><font size=3D1 =
face=3DArial><span
lang=3DEN-US style=3D'font-size:9.0pt;font-family:Arial'>Hi, =
all,<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>I
am trying to use cfi <st1:chmetcnv TCSC=3D"0" NumberType=3D"1" =
Negative=3D"False"
HasSpace=3D"True" SourceValue=3D"1.4" UnitName=3D"in" w:st=3D"on">1.4 =
in</st1:chmetcnv>
linux-<st1:chsdate IsROCDate=3D"False" IsLunarDate=3D"False" Day=3D"30" =
Month=3D"12"
Year=3D"1899" w:st=3D"on">2.4.21</st1:chsdate>(use Intel P30 strata =
flash), as I
find in datasheet, Intel extended query structure is almost the same in =
CFI 1.3
&amp; 1.4. <o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>So
I just modified some code about CFI MinorVersion&#8217;s judgement in =
cfi_cmdset_0001.c
and cfi_cmdset_0001.h:<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fon=
t></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>I
got CFI_QUERY_SIZE as 36, and I can read the =
MajorVersion,</span></font><span
lang=3DEN-US> </span><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;font-family:Arial'>MinorVersion etc in the query, but the number =
of
device hard-partition always read as zero.<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fon=
t></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>What
happened? What should I do to solve this =
issue?<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fon=
t></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>in
cfi_cmdset_0001.h:<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&#8230;.<o:p></o:p></span></f=
ont></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>#define
CFI_READ_QUERY(map, base, adr, extp, size) =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>do
{&nbsp; \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
struct cfi_private *__cfi =3D map-&gt;fldrv_priv; =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
int __ofs_factor =3D __cfi-&gt;interleave * __cfi-&gt;device_type; =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
int __i; \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
for (__i=3D0; __i&lt;(size); __i++)&nbsp; \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
((unsigned char*)(extp))[__i] =3D&nbsp; \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
cfi_read_query(map, (base+(((adr)+__i)*__ofs_factor))); =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>}while(0);
<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fon=
t></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>#define
CFI_QUERY_SIZE(map, base, adr) ({ \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
struct cfi_private *__cfi =3D map-&gt;fldrv_priv; =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
int __ofs_factor =3D __cfi-&gt;interleave * __cfi-&gt;device_type; =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
struct cfi_pri_intelext __ext; \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
struct cfi_intelext_regioninfo __rinfo; \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
int __ofs =3D 0, __num_r, __ri; \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
CFI_READ_QUERY(map, base, adr, (&amp;__ext), sizeof(__ext)); =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
__ofs +=3D sizeof(__ext); \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
if (__ext.MajorVersion =3D=3D '1' &amp;&amp; ((__ext.MinorVersion =3D=3D =
'3') ||<b><span
style=3D'font-weight:bold'> (__ext.MinorVersion =3D=3D '4')</span></b>)) =
{ \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
__ofs +=3D (__ext.NumProtectionFields - 1) * (sizeof(__u32) + 6); =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
__ofs +=3D 6; \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
__num_r =3D cfi_read_query(map, (base + ((adr+__ofs)*__ofs_factor))); =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
__ofs ++; \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
for (__ri=3D0; __ri &lt; __num_r; __ri++) { =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
CFI_READ_QUERY(map, base, adr+__ofs, (&amp;__rinfo), sizeof(__rinfo)); =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
__ofs +=3D sizeof(__rinfo); \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
__ofs +=3D (__rinfo.NumBlockTypes - 1) * sizeof(struct =
cfi_intelext_blockinfo); \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
} \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
} \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
__ofs; \<o:p></o:p></span></font></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>})<o:p></o:p></span></font></=
p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'>&#8230;.<o:p></o:p></span></f=
ont></p>

<p class=3DMsoNormal align=3Dleft =
style=3D'text-align:left;layout-grid-mode:char'><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fon=
t></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Times New Roman"><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0013_01C64A9C.F628F230--

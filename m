Received: from tolkor.sgi.com ([192.48.180.13])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Xh2l-0001Ax-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 12:44:31 +0100
Received: from ledzep.americas.sgi.com (ledzep.americas.sgi.com [137.38.226.97])
	by tolkor.sgi.com (8.12.2/8.12.2/linux-outbound_gateway-1.2) with ESMTP id g6PBiUK3005842
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 06:44:30 -0500
Received: from archer.americas.sgi.com (archer.americas.sgi.com [137.38.88.26]) by ledzep.americas.sgi.com (SGI-SGI-8.9.3/americas-smart-nospam1.1) with ESMTP id GAA37152 for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 06:44:30 -0500 (CDT)
Received: from sgi.com (localhost [127.0.0.1]) by archer.americas.sgi.com (8.8.8/ASC-news-1.4) with ESMTP id GAA137586 for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 06:44:29 -0500 (CDT)
Message-ID: <3D3FE49D.2BED07CE@sgi.com>
Date: Thu, 25 Jul 2002 06:44:29 -0500
From: Steven Hein <ssh@sgi.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: CVS access working?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

Does anyone know if CVS access (as documented on the
main linux-mtd page) is currently working?  I tried
from several machines, at home and at work, and I
see a "Connection refused" on the "cvs login"
when I follow the exact commands listed on the page
(for anonymous CVS access).  Should this be working
for me?  Any tips would be helpful.

Specifically, here's what I see:

3$ cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs login
(Logging in to anoncvs@cvs.infradead.org)
CVS password:     <I enter 'anoncvs' here>
cvs [login aborted]: connect to cvs.infradead.org:2401 failed:
Connection refused
74$ 

Thanks!
Steve

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Steve Hein (ssh@sgi.com)              Engineering Diagnostics/Software
Silicon Graphics, Inc.                          
1168 Industrial Blvd.                 Phone: (715) 726-8410
Chippewa Falls, WI 54729              Fax:   (715) 726-6715
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

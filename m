Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MQ1y-0003Av-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 08:48:50 +0000
Received: from jocke.lumentis.se (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id JAA27225
	for <linux-mtd@lists.infradead.org>; Fri, 4 Jan 2002 09:59:15 +0100 (MET)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
To: linux-mtd@lists.infradead.org
Date: Fri, 4 Jan 2002 09:59:15 +0100
References: <0111121314140A.28381@jocke.lumentis.se>
In-Reply-To: <0111121314140A.28381@jocke.lumentis.se>
MIME-Version: 1.0
Message-Id: <02010409585400.10979@jocke.lumentis.se>
Content-Transfer-Encoding: 8bit
Subject: CLEANMARKER question
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

Hi all

I am trying to understand the scan procedure in JFFS2 since I want to improve 
the speed in mounting a JFFS2 FS.

I have problems to understand the CLEANMARKER concept. Can a flash erase 
sector which has a CLEANMARKER in the beginning contain any data or can one 
assume that the rest of the erase sector is erased?

  Jocke

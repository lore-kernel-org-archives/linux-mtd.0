Received: from blood.actrix.co.nz ([203.96.16.163])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ec8J6-0004Fy-F3
	for linux-mtd@lists.infradead.org; Tue, 15 Nov 2005 16:25:46 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org, "Artem B. Bityutskiy" <dedekind@yandex.ru>
Date: Wed, 16 Nov 2005 10:24:00 +1300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511161024.00999.manningc2@actrix.gen.nz>
Cc: 
Subject: Some JFFS3 feedback
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem

I briefly read the JFFS3 doc, and will read it more. It has some very 
interesting ideas in it.

About 9 years back, I did some flash file system patent research and IIRC one 
of the patents covered something very similar to the Wandering Tree approach 
to addressing the write-in-place problem, so there might be some IP issues 
with this. I shall have a scratch around to see if I can find it (though 
finding something in a 20+ year old paper mountain is a challenge).

I will be interested to see how you tackle the dreaded garbage collection. 
IMHO, GC is something that needs to be considered sooner rather than later 
because it is key to sustained write performance.

I know that it is hard to change a name, but JFFS3 is really not much like 
JFFS2 or JFFS in design, so keeping a similar name really gets confusing 
later on (I get enough problems with yaffs and yaffs2 and they share 90% of 
the code). I would suggest a name change to avoid confusion down the track.

Regards

-- Charles

Received: from fobos.marketsite.ru ([62.152.84.30] helo=relay1.dataart.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D4GKE-0005Nh-8I
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2005 05:34:31 -0500
Message-ID: <421DAD37.7080406@yandex.ru>
Date: Thu, 24 Feb 2005 13:32:23 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>
References: <44BDAFB888F59F408FAE3CC35AB47041014F9285@orsmsx409>
In-Reply-To: <44BDAFB888F59F408FAE3CC35AB47041014F9285@orsmsx409>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: xattr support  for JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Keshavamurthy, Anil S wrote:
> Hi,
> 	I am new to this mailing list but would like to contribute to
> xattr for flash file system. While looking at the archive seems like
> jffs2 is just a bug fix only and any new feature development should go
> to jffs3. So here is my question.
> 1) Is JFFS3 a completely rewritten file system? If true, what stage are
> we w.r.t JFFS3? 
> 2) Where can I find the sources for JFFS3? Sorry, if this is a stupid
> question.
Well, the situation with JFFS3, as *I* see it, is as follows.
Thus far, JFFS3 is on its design stage. There are a lot of interesting 
ideas and proposals (including xattr) exist. I'm trying to summarize 
them and to keep track of them in the "JFFS2 design issues" document 
which one might find either on the MTD Web page or in CVS 
(fs/jffs3/JFFS3design.tex). I'm trying to keep track of good offers 
there. I'm limited in time but I'm doing my best.

The JFFS3 stuff which you may find in MTD CVS is merely the test 
platform where one could try new features.

> 
> 
> Thanks and appreciate your help.
> 
> -Anil
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

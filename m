Received: from pd9e41b01.dip.t-dialin.net ([217.228.27.1] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1752us-0004QL-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 May 2002 12:13:58 +0100
Message-Id: <200205071119.g47BJko05159@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Robert Schwebel <robert@schwebel.de>, linux-mtd@lists.infradead.org
Subject: Re: 2.4.18-howto?
Date: Tue, 7 May 2002 13:19:45 +0200
References: <20020503214738.U13984@schwebel.de> <20020507074246.M16630@schwebel.de>
In-Reply-To: <20020507074246.M16630@schwebel.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tuesday, 7. May 2002 07:42, Robert Schwebel wrote:
> On Fri, May 03, 2002 at 09:47:38PM +0200, Robert Schwebel wrote:
> > can somebody give me a short pointer what has to be done to patch 2.4.18
> > with the mtd stuff from cvs?
>
> Too trivial...? Should it just work? If I missed a HOWTO please excuse,
> I've tried hard to find one :) A short pointer would be great.
>
> Is anybody currently able to compile the utilities?
Yep, I just type make in the util directory and they compile without 
complains. I get the code out of CVS enter the directory patches, do 
.patchin.sh with my kernel directory as argument, then change to util, type 
make and that's it.

-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de

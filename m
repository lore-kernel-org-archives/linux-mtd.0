Received: from creative.actrix.co.nz ([203.96.26.135])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16a1z9-0007X2-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Feb 2002 21:58:11 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: David Mackay <monitoreurope@yahoo.co.uk>,
	Linux MTD Lists <linux-mtd@lists.infradead.org>
Subject: Re: CF
Date: Mon, 11 Feb 2002 11:03:28 +1300
References: <20020206162551.30552.qmail@web20309.mail.yahoo.com>
In-Reply-To: <20020206162551.30552.qmail@web20309.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020210220705.4B5021212@creative.actrix.co.nz>
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

About 2 weeks back there was a bit of a discussion on this....

* To the best of my knowledge, CF does not perform any explicite wear 
levelling. Rather, the method used to cycle through the blocks will tend to 
result in some wear levelling. 

I agree with Vipin re CF's reliability. It is a Kleenex technology. It is not 
very robust and is prone to curruption on many fronts.

-- CHarles


On Thu, 07 Feb 2002 05:25, David Mackay wrote:
> We have just been informed that CF disks have wear
> levelling built in and we do not need therfore to
> consider a file system such as JFFS(2), is this true?
>
> Is so any comments about how sucsessful it is?
>
> Thanks, David
>
> __________________________________________________
> Do You Yahoo!?
> Everything you'll ever need on one web page
> from News and Sport to Email and Music Charts
> http://uk.my.yahoo.com
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16pWnw-0006e2-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2002 15:54:40 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020323112215.B13151@wohnheim.fh-wedel.de> 
References: <20020323112215.B13151@wohnheim.fh-wedel.de>  <3C9BA0DD.B3827964@seranoa.com> 
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: Andrew Dixon <andrew.dixon@seranoa.com>,
    "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: CVS tags? 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Date: Mon, 25 Mar 2002 15:54:35 +0000
Message-ID: <21815.1017071675@redhat.com>
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

joern@wohnheim.fh-wedel.de said:
> Whow, someone noticed!
> That tag belongs to the mtd-2_5-newpartcode-branch, which should get
> included into 2.5 as soon as David has actually read and approved the
> code. It is working stable for me, on four different platforms with up
> to 10 mtd devices, each one being partitioned. But noone else uses the
> code, as far as I know of, so the decision is yours. :-) 

I will start paying attention to this soon, I promise. In the meantime, it 
would be good if people could start testing it. 

The current plan, such as there is one, is to wait for Marcelo to 
release 2.4.19 with the MTD fixes that are already in his tree, then send 
the remainder of the new code which I didn't want to go into such a late 
prerelease. Then I'll update the code to build in 2.5 and use all the stuff 
in compatmac.h for the 2.4 build, and send that to Linus. 

At that point, I'll be looking to merge Jörn's partition code - so if it 
doesn't work for you, make sure you've squealed by that point.

--
dwmw2

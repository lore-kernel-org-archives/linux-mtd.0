Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fOJI-0003Tl-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 16:49:08 +0000
Date: Mon, 25 Feb 2002 08:55:47 -0800 (PST)
From: Adam Wozniak <awozniak@comdev.cc>
To: Robert Kaiser <rob@sysgo.de>
cc: David Woodhouse <dwmw2@infradead.org>,  <linux-mtd@lists.infradead.org>,
    Jonas Holmberg <jonas.holmberg@axis.com>
Subject: Re: Re-entrancy of flash erase/write 
In-Reply-To: <Pine.LNX.4.21.0202251744570.12881-200000@dagobert.svc.sysgo.de>
Message-ID: <Pine.LNX.4.33.0202250854540.28416-100000@rangers.comdev.cc>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 25 Feb 2002, Robert Kaiser wrote:
> On Mon, 25 Feb 2002, Adam Wozniak wrote:
>
> > ENABLE/DISABLE_VPP  call the map_info set_vpp function
> > For the physmap_map map_info, there is no set_vpp, it is NULL
> >
> > So for people who use physmap_map anyway, they won't see the behavior
> > you are describing.  I suspect it is the same for other maps.
>
> Hmm, so you are suggesting that this problem has not been noticed
> because so few people have set_vpp() functions these days ?

It explains why many people may not see the problem you're describing.
I have no way to test that theory, however. =)

--Adam
-- 
Adam Wozniak (KG6GZR)   COM DEV Broadband - Digital and Software Systems
awozniak@comdev.cc      805 Aerovista Place, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055

Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iJLM-00026z-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2002 18:07:20 +0000
Date: Tue, 5 Mar 2002 10:18:41 -0800 (PST)
From: Adam Wozniak <awozniak@comdev.cc>
To: David Woodhouse <dwmw2@infradead.org>
cc: <linux-mtd@lists.infradead.org>,  <jffs-dev@axis.com>
Subject: Re: MTD CVS update: 'mtd/fs/jffs2 gc.c' 
In-Reply-To: <1254.1015352039@redhat.com>
Message-ID: <Pine.LNX.4.33.0203051017480.15504-100000@rangers.comdev.cc>
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

I don't understand.  Why does it need a BK repository?  Is CVS not sufficient?
Will these diverge, or is this just an alternate way to get at the same stuff?

--Adam

On Tue, 5 Mar 2002, David Woodhouse wrote:
> I've imported one more change onto the jffs2-2_4-branch and also made a
> public BK repository for it, including the shared-zlib stuff.

-- 
Adam Wozniak (KG6GZR)   COM DEV Broadband - Digital and Software Systems
awozniak@comdev.cc      805 Aerovista Place, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055

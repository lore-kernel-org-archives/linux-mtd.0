Date: Wed, 19 Jan 2005 13:07:39 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
In-Reply-To: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
Message-ID: <Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: RE: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 18 Jan 2005, Joakim Tjernlund wrote:

> > 
> > There was interesting offer to calculate checksum from the end of buffer 
> > since it implies better L1 cache behaviour. Then there was another 
> > argument against this idea - it was standed that some CPUs might be 
> > capable to prefetch data forward and not capable to do it backward.
> 
> Sorry for being so quiet lately, work is a bit much currently.
> 
> Another idea is to calculate the checksum while reading/writing(much like
> the networking code does). That would probably require support from the MTD layer
> and that the checksum is stored at the end of the JFFS3 node.
Hmm. How to do this? In case of NAND we issue 
read command and provide buffer, and it is up to driver/hw how to read. 
One may use DMA.

>  Jocke
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

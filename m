Date: Thu, 13 Jan 2005 13:18:02 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1105619501.26551.163.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.58.0501131317560.17331@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501131219480.17331@phoenix.infradead.org>
	<1105619501.26551.163.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: CRC on Read-Only partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I don't care. You show me formal proof that there cannot ever be an
> error, or we check the CRC anyway :)
I'm sorry, I mistiteled the mail. No doubt, CRC checking is needed to 
detect problems. They may come from different sources, not only NAND 
technology.

But I formulated question as: "does NAND technology imply that RO 
partition may become bad, and it is normal?".

The question is about NAND technology.

Ok, thin about Joern's phrase:
> What happens, if crucial data in flash gets corrupted and is unusable?
> Say, /sbin/init.

Now imagine we have this data on RO partition. Other non-sensitive data on 
RW partition. So, does this mean that only non-sensitive data may be 
corrupted? Can we keep safe our RO data this way? I only mean the 
corruptions due to *NAND technology*

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

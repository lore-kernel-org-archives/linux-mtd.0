Received: from web53609.mail.yahoo.com ([206.190.37.42])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Co0uA-000173-0m
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 09:52:44 -0500
Message-ID: <20050110145219.4082.qmail@web53609.mail.yahoo.com>
Date: Mon, 10 Jan 2005 06:52:19 -0800 (PST)
From: Komal Shah <komal_shah802003@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20050107092806.72155.qmail@web53604.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: Chip mapping AM29LV320D
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

> 
> But your board is a _custom_ board. How could anyone
> have written the
> same mapping driver already? Nobody has a board the
> same as yours.

Correct. We are going to have few boards only for demo
purpose.

> 
> The mapping driver just sets things up correctly for
> access to the flash
> chips, depending on the physical address and size
> etc. That's all
> specific to _your_ board.

Yes. I looked at few mapping drivers and understood
them.

> 
> I think the AM29LV320D is CFI-compliant so you don't
> _need_ specific
> support for it. It should just work with cfi_probe.
> 

Yes. AM29LV320D is CFI-compliant. 

Thanx for the reply.

---Komal Shah


		
__________________________________ 
Do you Yahoo!? 
The all-new My Yahoo! - What will yours do?
http://my.yahoo.com 

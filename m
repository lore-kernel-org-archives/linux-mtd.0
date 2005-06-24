Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DlrQ6-0003UX-U4
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2005 12:52:48 -0400
Date: Fri, 24 Jun 2005 18:52:43 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: sean@infradead.org
Message-ID: <20050624165243.GA18312@wohnheim.fh-wedel.de>
References: <E1DlT1z-0001Si-DN@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1DlT1z-0001Si-DN@phoenix.infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/drivers/mtd rfd_ftl.c,1.1,1.2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 June 2005 15:50:15 +0100, sean@infradead.org wrote:
> +
> +	for (i=0; i<SECTOR_SIZE; i++) {
> +		if (buf[i])
> +			break;
> +	}
> +
> +	if (i < SECTOR_SIZE) {
> +		rc = do_writesect(dev, sector, buf, &old_addr);
> +		if (rc)
> +			goto err;
> +	}
> +	else 
> +		part->sector_map[sector] = -1;

I don't like this part too much.  Effectively, you're using "i" as a
state variable.  In this specific case, it's not too bad, but my
experience with state variable is that they always hurt.

Maybe something like this:

+	for (i=0; i<SECTOR_SIZE; i++) {
+		if (!buf[i])
+			continue;
+		rc = do_writesect(dev, sector, buf, &old_addr);
+		if (rc)
+			goto err;
+	}
+
+	if (i == SECTOR_SIZE)
+		part->sector_map[sector] = -1;

Or even:

+	for (i=0; i<SECTOR_SIZE; i++) {
+		if (!buf[i])
+			continue;
+		rc = do_writesect(dev, sector, buf, &old_addr);
+		if (rc)
+			goto err;
+		goto hit;
+	}
+
+	/* no hit */
+	part->sector_map[sector] = -1;
+hit:

Now we have one additional goto and your cs professor would fail you
in class, but code flow and data is nicely seperated.

Jörn

-- 
Mac is for working, 
Linux is for Networking, 
Windows is for Solitaire! 
-- stolen from dc

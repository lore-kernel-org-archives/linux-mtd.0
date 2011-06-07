Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTo3w-0001P4-P0
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 04:38:45 +0000
Received: by eyh6 with SMTP id 6so1934128eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 21:38:42 -0700 (PDT)
Subject: Re: ubifs_decompress: cannot decompress ...
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1307389926-12209-1-git-send-email-mlcreech@gmail.com>
References: <1307377091.3112.100.camel@localhost>
	<1307389926-12209-1-git-send-email-mlcreech@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 07:34:26 +0300
Message-ID: <1307421266.11104.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 15:52 -0400, Matthew L. Creech wrote:
>  		ubifs_err("scan error %d", (int)PTR_ERR(sleb));
> +		printk(KERN_DEBUG "\tLEB data buffer:\n");
> +		print_hex_dump(KERN_DEBUG, "\t", DUMP_PREFIX_OFFSET, 32, 1,
> +			       buf, c->leb_size, 0);

No, I have difficulties reading hexdumps. You have set of good nodes
following by one broken node. I wanted to see a human-readable dump of
the good nodes at the beginning of the LEB.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

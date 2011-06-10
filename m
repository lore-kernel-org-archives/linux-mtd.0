Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUt0s-0000QY-GN
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2011 04:08:03 +0000
Received: by eyh6 with SMTP id 6so954125eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 21:07:59 -0700 (PDT)
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
In-Reply-To: <mkn1v6d8n8i3pnsg89gppnv69ht102hj0c@4ax.com>
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
	<1307623105.7374.91.camel@localhost>
	<mkn1v6d8n8i3pnsg89gppnv69ht102hj0c@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Jun 2011 07:03:40 +0300
Message-ID: <1307678620.7374.131.camel@localhost>
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

On Thu, 2011-06-09 at 17:18 +0200, Gilles wrote:
> 2. ubiformat takes about 10-15mn to complete: Is there a way to speed
> things up, or is it just due to the CPU+NAND that the appliance uses?

http://www.linux-mtd.infradead.org/faq/ubi.html#L_attach_faster

> 3. Finally, when do I have to use ubimkvol?

When you want to dynamically (run-time) create a new UBI volume. You do
not necessarily have to do this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

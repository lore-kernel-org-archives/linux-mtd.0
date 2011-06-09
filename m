Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUeZS-0006Xd-Um
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 12:42:47 +0000
Received: by eyh6 with SMTP id 6so639439eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 05:42:44 -0700 (PDT)
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
In-Reply-To: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 15:38:25 +0300
Message-ID: <1307623105.7374.91.camel@localhost>
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

On Thu, 2011-06-09 at 12:24 +0200, Gilles wrote:
> vol_size=248MiB

Put, say, 230MiB here. 248MiB is the total amount of space. UBI adds
some overhead, so your volume size will be smaller, see here:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_overhead

The autoresize flag that you specified will make sure your volume will
be automatically re-sized to the maximum size when you first attach the
MTD device.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

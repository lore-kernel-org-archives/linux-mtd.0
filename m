Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PxItU-0003hE-5O
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2011 12:53:36 +0000
Received: by ewy3 with SMTP id 3so136385ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Mar 2011 04:53:34 -0800 (PST)
Subject: Re: Perf issue with UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bhavesh Parekh <bhaveshparekh1@gmail.com>
In-Reply-To: <1299587464.2754.27.camel@localhost>
References: <AANLkTin4FHcpvhsQJkU7pOUPk3-gV+N+1cb0W6_3KC8P@mail.gmail.com>
	<1299587464.2754.27.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Mar 2011 14:51:54 +0200
Message-ID: <1299675114.2741.6.camel@localhost>
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

On Tue, 2011-03-08 at 14:31 +0200, Artem Bityutskiy wrote:
> But please, try UBIFS bulk_read option, does it make any difference for
> you?

Ah, and of course, use the 'no_chk_data_crc' option to have more fair
comparison!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

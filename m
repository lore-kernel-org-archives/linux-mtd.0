Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17gkui-0003wi-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2002 12:41:40 +0100
Date: Mon, 19 Aug 2002 13:41:37 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Michael Palme <m.palme@goepel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: newbie: dynamic partition creation possible
Message-ID: <20020819114137.GA9858@wohnheim.fh-wedel.de>
References: <3D60CEBE.7090806@goepel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3D60CEBE.7090806@goepel.com>
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

On Mon, 19 August 2002 12:55:58 +0200, Michael Palme wrote:
> i would like to know if it is possible to create flash dynamic 
> partitions (i mean other way than directly in the sources). in the howto 
> ive read it is impossible, but in some sources i found 
> part_type="static" -- and so i've concluded "dynamic" is also an option? 
> if this is possible can somebody explain the way to do it please.

What exactly do you mean by "dynamic"?

There are two methods to create partitions:
- Use a partition table parser and create a partition table.
- Provide a mapping driver and hard-code the partition layout in the
  driver.

Do you mean partition table?

Jörn

-- 
When you close your hand, you own nothing. When you open it up, you
own the whole world.
-- Li Mu Bai in Tiger & Dragon

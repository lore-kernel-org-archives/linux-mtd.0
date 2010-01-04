Received: from [193.13.178.8] (helo=miranda.se.axis.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NRk1G-0000hD-5J
	for linux-mtd@lists.infradead.org; Mon, 04 Jan 2010 10:18:42 +0000
Date: Mon, 4 Jan 2010 11:17:59 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Arno Steffen <arno.steffen@web.de>
Subject: Re: Empty flash at ... / check_node_data: wrong data CRC 
In-Reply-To: <1123501046@web.de>
Message-ID: <Pine.LNX.4.64.1001041113280.5028@lnxricardw.se.axis.com>
References: <1123501046@web.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 4 Jan 2010, Arno Steffen wrote:

> I do have a system which is not used with a controlled shutdown, but
> with a cold heartless poweroff only.
>
> I am using a jffs2 filesystem as it should be journalling and robust
> agains power loss.
>
> But while boot I get  messages like:
>
> Empty flash at 0x00963864 ends at 0x00964000
>
> And after finishing boot:
>
> [root@EEE ]# JFFS2 notice: (181) check_node_data: wrong data CRC in
> data node at 0x01f8b55c: read 0xa7496669, calculated 0x5aea21d5.
> JFFS2 notice: (181) check_node_data: wrong data CRC in data node at
> 0x01f88d3c: read 0xc5d341c, calculated 0x3f0d9534.
>
> This sound seroius to me. How to prevent this if I can't use "halt" or
> other controlled shutdown?

On the surface of it, it looks alarming, but generally it isn't serious. Se=
e:
http://www.linux-mtd.infradead.org/faq/jffs2.html#L_messages .

In my own experience I get this question a lot, but so for no one has been=
=20
able to show any ill effects such as files disappearing or getting=20
mangled. That would be reason for worry.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30

Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mem9m-0000De-8j
	for linux-mtd@lists.infradead.org; Sat, 22 Aug 2009 08:41:06 +0000
Message-ID: <4A8FAEFA.6070304@gmail.com>
Date: Sat, 22 Aug 2009 11:40:26 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: Ideal NAND flashes for JFFS2 or YAFFS
References: <OF10187A22.DA46F228-ONC125761A.002E1EB3-C125761A.002EB9BA@transmode.se>
In-Reply-To: <OF10187A22.DA46F228-ONC125761A.002E1EB3-C125761A.002EB9BA@transmode.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/22/2009 11:30 AM, Joakim Tjernlund wrote:
>
> We are looking into using NAND flash instead of NOR flashes in our design and I am
> trying to find out how the ideal NAND flash should look like to be used as a JFFS2 or YAFFS
> file system. We are mainly looking for speed and reliability. Power cuts are common
> for our boards.

Not sure about the FSes, but we are happy with speed and reliability
of OneNAND from Samsung.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

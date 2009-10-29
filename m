Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N3UKY-0001Xm-Oj
	for linux-mtd@lists.infradead.org; Thu, 29 Oct 2009 12:42:22 +0000
Subject: Re: UBIFS second time booting issue
From: Artem Bityutskiy <dedekind1@gmail.com>
To: rithesh@tesbv.com
In-Reply-To: <20091029100016.q2rdiwtp2c04g8g8@bangalore.tesbv.com>
References: <20091026145935.uvck3scgs8wgcc8o@bangalore.tesbv.com>
	<e8775dd00910260305v1c6ebe76t56eca8e09071e562@mail.gmail.com>
	<20091029100016.q2rdiwtp2c04g8g8@bangalore.tesbv.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 29 Oct 2009 10:22:22 +0200
Message-Id: <1256804542.29885.828.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, thomas@tesbv.com, jobi@tesbv.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-29 at 10:00 +0530, rithesh@tesbv.com wrote:
> Hello All,
> 
> I am able to flash the ubifs filesystem using "ubiformat" and now it  
> is booting consistently.
> Please suggest me a way to flash the ubifs in a factory setup, i am  
> presently unable do this using SAM-ICE program for at91sam9260ek.

Hi, the algorithm is roughly described here:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

Date: Tue, 16 Nov 2004 11:42:26 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@phoenix.infradead.org>
To: MTD List <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.58.0411161137370.25950@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: (no subject)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


David Woodhouse wrote:
> On Mon, 2004-11-15 at 11:34 +0300, Artem B. Bityuckiy wrote:
> 
>>Hello guys,
>>
>>I would be happy to know your opinions about to introduce one more 
>>32-bit field to the node_ref structure in the JFFS2. Is this really bad?
> 
> 
> Yes but if you make a really good case for it and you finish the bits
> which allow us to drop the length field we might let you get away with
> it :)
> 
It seems I've found the way how to avoid this. But I need more bits in the 
node_ref structure. The flash_offset field is already used so I have 
decided to use the next_in_ino field which is always at least 4-byte 
aligned. It is the dangerous game with adresses, but I really want to 
save memory. Do you think it is OK? (I think yes)

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DXetc-0008Dn-7v
	for linux-mtd@lists.infradead.org; Mon, 16 May 2005 08:40:33 -0400
Message-ID: <42889498.5080003@yandex.ru>
Date: Mon, 16 May 2005 16:39:52 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
References: <f6d0cd0605051603533fa9fbd1@mail.gmail.com>
In-Reply-To: <f6d0cd0605051603533fa9fbd1@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 error while Copying
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Niraj Maheshwari wrote:
> Node totlen on flash (0x00800080) != totlen from node ref (0x0000000c).
I asked about your message in IRC:

dedekind dwmw2, "Node totlen on flash (0x00800080) != totlen from node 
ref (0x0000000c)" - have you ever seen something like this ?
jwb that looks like a status register
jwb 0x00800080 i mean
dedekind hmm
dedekind i.e. he configured partition incorrectly ?
dedekind and reads some mapped registers?
jwb not necessarily
jwb it could be that the MTD and JFFS2 layers were out of sync
jwb or it could just be random data that just _looks_ like the value of 
a status register
dwmw2 soudns like a flash driver bug
dwmw2 I've seen that kind of thing before, yes
dwmw2 flash in status mode when we think we're reading from it

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

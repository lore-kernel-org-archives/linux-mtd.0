Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeTNz-0004Eg-0N
	for linux-mtd@lists.infradead.org; Fri, 12 May 2006 04:52:42 -0400
Message-ID: <44644CE7.6060909@ru.mvista.com>
Date: Fri, 12 May 2006 12:52:55 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Russ Dill <russ.dill@gmail.com>
References: <4461B7CD.9010100@ru.mvista.com>	
	<625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>	
	<4461CC8C.6010105@ru.mvista.com>
	<f9d2a5e10605111206i4a5a425el17a28bb81989c6b6@mail.gmail.com>
In-Reply-To: <f9d2a5e10605111206i4a5a425el17a28bb81989c6b6@mail.gmail.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Josh Boyer <jwboyer@gmail.com>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Russ Dill wrote:
> Free block list? Bad block list? Tracking of block numbers? Sounds
> like a full on FTL to me.
I'd rather go modifying mtdblock_ro. I don't want to implement FTL 
because 1) as David pointed out, I don't need to handle writes; 2) I'm 
afraid we may end up dealing with patent issues here again.

Vitaly

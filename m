Received: from host2.bln.innominate.com ([77.245.32.75]
	helo=home.innominate.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9IAm-0004wh-6A
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 13:28:29 +0000
Date: Tue, 4 May 2010 15:28:24 +0200
From: Christian Hohnstaedt <chohnstaedt@innominate.com>
To: Murali N <nalajala.murali@gmail.com>
Subject: Re: unable to run "flash_eraseall" on ARM target!!!
Message-ID: <20100504132824.GM20932@elara.bln.innominate.local>
References: <t2q630851df1005040439hf116acd1ucd73738e90dc5731@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t2q630851df1005040439hf116acd1ucd73738e90dc5731@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, May 04, 2010 at 05:09:57PM +0530, Murali N wrote:
> Hi,
> i have compiled the mtd-utils for android using arm-eabi-4.4.0 tool chain.
> I tried erasing the flash using "flash_eraseall" on target but i am
> getting the below errors!!!
> 
> # ./flash_eraseall
>     ./flash_eraseall
>     ./flash_eraseall: not found

This looks like a missing library loader.
Did you link dynamically ?
Do you have ld-linux.so (glibc) or ld-uClibc.so (ulibc) in /lib ?


Christian

-- 
Christian Hohnstaedt / Project Manager Hardware and Manufacturing

Innominate Security Technologies AG / protecting industrial networks
tel: +49.30.921028.208 / fax: +49.30.921028.020
Rudower Chaussee 13, D-12489 Berlin / http://www.innominate.com

Register Court: AG Charlottenburg, HR B 81603
Management Board: Dirk Seewald
Chairman of the Supervisory Board: Volker Bibelhausen

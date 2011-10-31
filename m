Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RKxae-0007Ou-Q1
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2011 19:32:13 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 05/13] mtd/docg3: add multiple floor support
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
	<1319824292-11085-6-git-send-email-robert.jarzmik@free.fr>
	<4EAEDBA3.6050005@newsguy.com>
Date: Mon, 31 Oct 2011 20:32:00 +0100
In-Reply-To: <4EAEDBA3.6050005@newsguy.com> (Mike Dunn's message of "Mon, 31
	Oct 2011 10:32:19 -0700")
Message-ID: <87pqhd7ya7.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Dunn <mikedunn@newsguy.com> writes:

> On 10/28/2011 10:51 AM, Robert Jarzmik wrote:
>> Add support for multiple floors, ie. cascaded docg3
>> chips. There might be 4 docg3 chips cascaded, sharing the
>> same address space, and providing up to 4 times the storage
>> capacity of a unique chip.
>>
>> Each floor will be seen as an independant mtd device.
>>
>
> Do we know of any products that contain multiple doc devices in a cascaded
> configuration? 
Yes, my board Mitac mioa701 has floors 0 and 1 in it.

--
Robert

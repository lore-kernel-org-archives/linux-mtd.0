Received: from [200.53.172.146] (helo=qis)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15leg0-0003jv-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2001 23:58:13 +0100
Message-ID: <20010924221212.11724.qmail@qis>
References: <20010922160958.5797.qmail@qis>
            <20004.1001233928@redhat.com>
In-Reply-To: <20004.1001233928@redhat.com> 
From: "Nikolai Vladychevski" <niko@isl.net.mx>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: nftl driver
Date: Mon, 24 Sep 2001 22:12:12 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

David Woodhouse writes: 

> 
> niko@isl.net.mx said:
>>  If this problem of writing zeros  is due to the module unloading
>> problem, how can I solve it if the driver is  in the kernel and cant
>> be reloaded? 
> 
> Almost certainly. The driver has lots if internal state about the old NFTL
> format cached, and you've gone and changed it all. You should never need to
> use nftl_format. If you want new data, just write new data to /dev/nftla. 
> You don't need to do a low-level format just to change the data.

well, its just my application requires it .... I have to nftl_format because 
I do not nftl_format at the 0x00000. There is another data of variable 
lenght that I place before nftla data, so i have to nftl_format 
0xSOME_OFFSET that is different evry time.... 

but ... if the driver doesn't come the application , the application will 
have to go to the driver... 

Nikolai

Received: from [67.18.166.194] (helo=warp.phpwebhosting.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HhmV6-0000PS-9f
	for linux-mtd@lists.infradead.org; Sat, 28 Apr 2007 08:58:10 -0400
Message-ID: <463344D7.2060503@indefia.com>
Date: Sat, 28 Apr 2007 15:57:59 +0300
From: Semih Hazar <semih.hazar@indefia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Strange JFFS2 Cleanmarker on NAND
References: <46322E19.7020409@indefia.com>
In-Reply-To: <46322E19.7020409@indefia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Semih Hazar wrote:
> I re-run the above step (without -j and with -j) and now cleanmarkers 
> are ok and I can mount it.
>   
Well It seems that this behavior is totally random. I did these steps 
lots of times, and sometimes the cleanmarker is written as:
ff ff 19 85 20 05 00 00  00 18 65 fa fd 45 00 00
00 00 00 00 00 00 00 00  00 00 ff ff ff ff ff ff
ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff

and sometimes written as:
ff ff 19 85 20 03 00 00 00 08 ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

Does the first one have any meaning or is it some messed up data ?

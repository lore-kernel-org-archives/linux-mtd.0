Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CFzTj-0001K8-En
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2004 14:28:34 -0400
Message-ID: <4166DC47.5010104@colleduc.ee>
Date: Fri, 08 Oct 2004 21:28:23 +0300
From: Kalev Lember <kalev@colleduc.ee>
MIME-Version: 1.0
To: Nicolas Pouillon <nipo@ssji.net>
References: <20041004215001.769d8017.nipo@ssji.net>	<Pine.LNX.4.44.0410051152070.2033-100000@kiire.colleduc.ee>
	<20041006213434.55d36d65.nipo@ssji.net>
In-Reply-To: <20041006213434.55d36d65.nipo@ssji.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Probing at 0x0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pouillon wrote:

>>I reimplemented the Diskonchip Millennium Plus support in the new
>>driver, but unfortunately I have only 16MB pieces at hand.
>>    
>>
>
>Does this mean it is actually supported but disabled by lack of tests ?
>My chip can be a (read only until i've not dumped it) "guinea pig" ;-)
>  
>
No, it is not supported. According to 
http://www.tri-m.com/products/msystems/files/specs/mddoc_spec.pdf the 32 
MB Millennium Plus has 16 bit data bus while the supported 16 MB Mil+ 
has 8 bit bus.

-- 
Best regards,
Kalev Lember

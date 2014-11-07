Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmYxM-0004sy-Ie
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 02:07:21 +0000
Date: Fri, 7 Nov 2014 10:06:49 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Subject: Re: [PATCH V2] mtd: spi-nor: prefer more specific entries from chips
 database
Message-ID: <20141107020648.GA30266@shldeISGChi005.sh.intel.com>
References: <1413963223-6365-1-git-send-email-zajec5@gmail.com>
 <1415257333-6488-1-git-send-email-zajec5@gmail.com>
 <20141107012115.GA28978@shldeISGChi005.sh.intel.com>
 <A765B125120D1346A63912DDE6D8B6315EA662@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315EA662@NTXXIAMBX02.xacn.micron.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Rafal Milecki <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 07, 2014 at 01:49:36AM +0000, Bean Huo 霍斌斌 (beanhuo) wrote:
> >> 2) n25q128a13 with ID 0x20bb181234
> >> we should prefer entry with the longer ID.
> >I perfer to make a limit before we add new item to the table:
> >   Put the longest one in the first place.
> 
> >By this way, we can avoid the too much "for"s in the following code which makes the code a little complicated.
>  
> >So It should looks like this in the table.     
>  > 1) n25q128a13 with ID 0x20bb181234
>  > 2) n25q128a11 with ID 0x20bb18
> 
> >Hi Brian, what's your opinion?
>   
> >thanks
> >Huang Shijie
> 
> In general,spi nor include three parts Id infor,
> 
> First,it is Manufacturer ID, size is 1 byte.
> 
> Second,it is Device ID,and size is 2 bytes,this sector will include memory
> type and capacity information.
> 
> Third,it is unique ID,and size is 17 bytes(now only used 2 bytes in linux),first byte
> will indicate length of data to follow,second byte is real Extended id,and
> very important.Next 14 bytes is optional,it can be customized factory data. 
> 
> Now in our linux,former two parts all be used for Deivce Id ,ant its size
> is 3 bytes.third part(extended id)be used 2 bytes,and called extended id.
> 
> In our Micron spi nor serials,there are some spi nor that the same Deivce id 
> with different extended ID,so in order to distinguish this,you only add extended id
> infor in struct spi_device_id spi_nor_ids,and don't let relevant spi nor Extended ID field
> is NULL.just as Spansion:
> 
> { "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> { "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
> { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
Sometimes, five bytes ID is not enough, please read the patch:
	http://lists.infradead.org/pipermail/linux-mtd/2014-August/055018.html

In current table, Micron's chips do not have five bytes ID yet.
But Spansion has already had many five bytes ID chips now.

thanks
Huang Shijie

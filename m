Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MsEOA-0003f1-Jr
	for linux-mtd@lists.infradead.org; Mon, 28 Sep 2009 11:27:35 +0000
Subject: Re: [MTD-Tests]- issue while inserting modules
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tadimarri Sarath Babu <sarath.babu@samsung.com>
In-Reply-To: <EFE8EA804139414AAAFE7C5C7F01F8D8@sisodomain.com>
References: <1FF44128171E4E6E900BD9EAEB332E73@sisodomain.com>
	<EFE8EA804139414AAAFE7C5C7F01F8D8@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Sep 2009 14:23:49 +0300
Message-Id: <1254137029.3778.59.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-09-17 at 17:24 +0530, Tadimarri Sarath Babu wrote:
> Hi,
> 
> Now I am able to run MTD Tests on OneNAND.
> MTD Tests by default takes the mtd0 as the device number as per the code.
> I disabled the Writable Mask in the 0th partition in my architecture specific file and it started 
> working.
> I am using the mtd2 partition as the mtd device . So i initialized the "dev" variable in 
> mtd_oobtest.c to the respective number and similarly all other test files.
> I feel user should be prompted with the mtd device number he wants to run these tests.
> Any comments?

May be, but this is why we have "modinfo". But feel free to send
a patch.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

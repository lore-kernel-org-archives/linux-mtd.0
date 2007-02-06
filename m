From: "Kyungmin Park" <kmpark@infradead.org>
To: <dedekind@infradead.org>
References: <45C2EE39.7050909@nokia.com>
	<003a01c748f0$48530620$c7a3580a@swcenter.sec.samsung.co.kr>
	<45C6DB35.3040106@nokia.com>
	<003d01c748f9$705677c0$c7a3580a@swcenter.sec.samsung.co.kr>
	<1170664239.3628.64.camel@sauron>
Subject: RE: [PATCH] [MTD] OneNAND: Do not allow oob write past end of page
Date: Tue, 6 Feb 2007 11:15:37 +0900
Message-ID: <005a01c74994$b5f5c9c0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <1170664239.3628.64.camel@sauron>
Cc: linux-mtd@lists.infradead.org,
	'Adrian Hunter' <ext-adrian.hunter@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian,

> 
> OneNAND stuff which we have now is _part of MTD_. MTD has its 
> interface, its model of the device. As long as we are part of 
> this infrastructure, we have to obey MTD's interface, rules 
> and restrictions.
> 
> The whole idea of MTD is to make upper layers to access 
> flashes in a uniform layer. MTD achieves this at certain 
> extent. There are flaws, but anyway. So basically OneNAND 
> implements more then NAND in this OOB handling stuff. And it 
> is bad. It encourages other people to write OneNAND-only 
> software, incompatible with NAND, which is totally 
> unreasonable in this case.
> 

I will push it.

BTW, after patch, we got dead code.
I downloaded oobtest again, re-run it and see that it trigger exception
code in onenand_do_write_oob
But it don't touch following codes whether include your patch or not.

        /* Do not allow write past end of device */
        if (unlikely(to >= mtd->size ||
            column + len > ((mtd->size >> this->page_shift) -
                                (to >> this->page_shift)) * oobsize)) {
                DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: Attempted to
write past end of device\n");
                return -EINVAL;
        }

Please check oobtest program.

Thank you,
Kyungmin Park

--

oobtest: Test 4 of 5
oobtest: erasing
oobtest: erased 0
oobtest: erased 128
oobtest: Attempting to start write past end of oob
oobtest: An error is expected...
oobtest: Error occurred as expected
oobtest: Attempting to start read past end of oob
oobtest: An error is expected...
oobtest: Error occurred as expected
oobtest: Attempting to write past end of device
oobtest: An error is expected...
-> onenand_write_oob: Attempt to write past end of page
oobtest: Error occurred as expected
oobtest: Attempting to read past end of device
oobtest: An error is expected...
oobtest: error: read past end of device
oobtest: Attempting to write past end of device
oobtest: An error is expected...
-> onenand_write_oob: Attempt to write past end of page
oobtest: Error occurred as expected
oobtest: Attempting to read past end of device
oobtest: An error is expected...
oobtest: error: read past end of device

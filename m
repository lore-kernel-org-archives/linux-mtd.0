Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MnqwQ-0005F7-VH
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 09:36:51 +0000
Subject: Re: Doubt regarding mtd test ( mtd_oobtest ) interpretation of oob
	data !
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Murali N <nalajala.murali@gmail.com>
In-Reply-To: <630851df0909160009w35efd6b2kb058593b59e1be66@mail.gmail.com>
References: <630851df0909160009w35efd6b2kb058593b59e1be66@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Sep 2009 12:36:10 +0300
Message-Id: <1253093770.3778.7.camel@localhost>
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

On Wed, 2009-09-16 at 12:39 +0530, Murali N wrote:
> Hi All,
> i have a doubt on how the OOB data is being managed in MTD driver.
> Recently i have enabled mtd-tests to test my driver for mtd
> compliance.After i ran "mtd_oobtest" i was messed up with test and
> come up with few questions:
> 
> 1) Is these tests are well validated? can i trust these tests 100%
> compliant to MTD API specification?
> 2) In "mtd_oobtest" ( drivers/mtd/tests/ ), there was a "test 4 of 5"
> in this there was a few checks for writing/reading end off OOB data.
>             - In these tests what is the significance of using
> "ooboffs" in OOB_AUTO mode?
> 3) Is MTD driver ask the below NAND driver to read/write the oob data
> integral of oobavail size in OOB_AUTO mode? How MTD driver behaves if
> it is not!!!
> 4) Finally, can anyone please explain bit more about OOB_PLACE mode?
> also the significance of ooboffs field usage?

I do not understand your questions, and I do not quite remember these
modes already, but the below code probably explains things well:

/*
 * oob operation modes
 *
 * MTD_OOB_PLACE:       oob data are placed at the given offset
 * MTD_OOB_AUTO:        oob data are automatically placed at the free
areas
 *                      which are defined by the ecclayout
 * MTD_OOB_RAW:         mode to read raw data+oob in one chunk. The oob
data
 *                      is inserted into the data. Thats a raw image of
the
 *                      flash contents.
 */
typedef enum {
        MTD_OOB_PLACE,
        MTD_OOB_AUTO,
        MTD_OOB_RAW,
} mtd_oob_mode_t;

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

Subject: Re: [PATCHv2 0/2] mtd: nand: Extend MLC support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <17c88de31cd52bb3794569c28cd2ae51996e6260@localhost.localdomain>
References: <17c88de31cd52bb3794569c28cd2ae51996e6260@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 15:19:20 +0300
Message-ID: <1273061960.3702.179.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, Reuben.Dowle@navico.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-05-04 at 20:58 -0700, Kevin Cernekee wrote:
> Part 1/2 is an improved version of my previous submission.  Additional
> checks were added to ensure that certain "5-byte" Micron and Samsung
> parts are not falsely detected as having 6-byte IDs.  I also rolled in
> the 256B NAND_MAX_OOBSIZE change.
> 
> Part 2/2 is a resubmission/rebase of Reuben Dowle's 2009/02/03 patch:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2009-February/024473.html
> 
> I am trying to compile a table of NAND IDs to make sure the detection
> algorithm correctly handles all known cases.  If you could send me the
> following information for any NAND chips you have access to (via
> private email), it would be appreciated:
> 
> 1) Part number
> 
> 2) ID code (please read 8 bytes so I can see where it wraps around)
> 
> 3) Device size, block size, page size, OOB bytes per page, bus width,
> and bad block marker location
> 
> 4) Datasheet, if available

Removed older patches and taken these ones to l2-mtd-2.6 / dunno.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

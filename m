Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwXeB-0008H5-06
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2011 10:58:55 +0000
Received: by gwb1 with SMTP id 1so1935976gwb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Aug 2011 03:58:52 -0700 (PDT)
Subject: Re: [PATCH 2/3] nandtest: print number of bits corrected during test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Date: Thu, 25 Aug 2011 14:00:45 +0300
In-Reply-To: <f46b9092828dde57ea4bb4ce661c4f15ff2e0888.1312922073.git.bengardiner@nanometrics.ca>
References: <e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
	<f46b9092828dde57ea4bb4ce661c4f15ff2e0888.1312922073.git.bengardiner@nanometrics.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314270049.18988.35.camel@sauron>
Mime-Version: 1.0
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

On Tue, 2011-08-09 at 16:57 -0400, Ben Gardiner wrote:
> The nandtest program monitors the corrected ecc stat to determine if an
> ECC correction has taken place during the last write-read. If so, it
> prints "ECC corrected".
> 
> The mtd subsytem will store the number of bits corrected in the corrected
> ecc stat so update the nandtest output to print also the number of bits
> corrected when performing the test.
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

Pushed this patch to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy

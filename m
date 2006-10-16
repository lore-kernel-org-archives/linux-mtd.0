Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GZYfk-0003Tr-RU
	for linux-mtd@lists.infradead.org; Mon, 16 Oct 2006 16:02:58 -0400
Received: by ug-out-1314.google.com with SMTP id p37so782894ugc
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Oct 2006 13:02:50 -0700 (PDT)
Message-ID: <ecb4efd10610161302t5dafcfcfnb70ad31a2b9abe02@mail.gmail.com>
Date: Mon, 16 Oct 2006 16:02:49 -0400
From: "Clem Taylor" <clem.taylor@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: flushing buffer cache on mtd device: is the verify in flashcp
	actually reading back from the flash chip or the cache?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Recently a question came up as to where we were really verifying that
the data was correctly being written to the flash. We are using
flashcp from a 2006.05.04 mtd snapshot to program the flash. Looking
at the code, after the write, it just does a lseek() back to the
beginning of the device and then starts reading. It is opening the
device with O_SYNC, but I thought that only effects writes, not reads.
Without doing something special, wouldn't this data just come from the
buffer cache instead of the physical device?

Is there something else doing on under the hood that would force a
read from physical device after a flash write?

                             Thanks,
                             Clem

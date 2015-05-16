Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ytkkm-0003Rs-7z
 for linux-mtd@lists.infradead.org; Sat, 16 May 2015 22:40:20 +0000
Received: by labbd9 with SMTP id bd9so170769574lab.2
 for <linux-mtd@lists.infradead.org>; Sat, 16 May 2015 15:39:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwrCO8BozRb3jkncWy+2w6y82zz+wtL2r_E9i3VT3N8HQ@mail.gmail.com>
References: <CAD=nrE_4tsSvKQ_Rz8XJpjJhfT-z+-Tkhn-SMvvcyUaPzg1PHA@mail.gmail.com>
 <CAAbfDBfXZCrRJ2M_MDGP8Pmo97tLiduYGHa2AdKasTya60e81A@mail.gmail.com>
 <CAD=nrE9=040qfZHQi349KAikhiRAr5YrPgO52-7bm9uA9WmW=Q@mail.gmail.com>
 <20150516205354.GK6055@norris-Latitude-E6410>
 <CAFLxGvwrCO8BozRb3jkncWy+2w6y82zz+wtL2r_E9i3VT3N8HQ@mail.gmail.com>
Date: Sun, 17 May 2015 00:39:57 +0200
Message-ID: <CAD=nrE915xc2_0znC=uzXjghhhueq=NqZhEmtFZ-Tvdfm1fXWw@mail.gmail.com>
Subject: Re: Tracking flash IO activity?
From: "valent.turkovic@gmail.com" <valent.turkovic@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here is some interesting info I found using mtdinfo tool:

# mtdinfo /dev/mtd5
mtd5
Name:                           rootfs_data
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          104 (6815744 bytes, 6.5 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:10
Bad blocks are allowed:         false
Device is writable:             true

So I see there are 104 eraseblocks on this partition. Interesting so
see finaly some numbers. Now how to see how many times these
eraseblock were issued "erase eraseblock" command?

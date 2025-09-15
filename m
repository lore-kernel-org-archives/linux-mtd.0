Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4260CAC592
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Sep 2025 18:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8gAnI2luLuUZanMYAP15WoSE7ds0WqhTtoU2J2jvV4Q=; b=i+cIaC7pDX+v6qNoeTd+JulPhm
	eCj5KEP5oaCj8CSFrFJsiDtnQ5C5IYDbj5aazu5nMN8OxKHQ1Kylf9pHkju6xMrdcxe2Ve34rY1/+
	inJ/r4jGZlJ333eMhlgiw9Y5Z60hN0g3rLfx5M8x++7WCe72JxGob1GHb6KAv1BhBvox1Hk4X1VWu
	KeQ46Dxi332J8hSlhp0rQ8JyTDpEvouvhh681EbPpCpX7izEn2uGnB3cyF7s2bSEU8y4Bo3Rfg6Vo
	DK3l8XwAHNYoVCVVkG96JV/2SM3viqcIaAf/MlbR9DWNDMwfHlaQAJHoec7Vcr1HyTYOVq4Q/3XH4
	TACGcfkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyEQK-00000005Sog-2IRA;
	Mon, 15 Sep 2025 18:59:36 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyEQH-00000005So4-3Oiq
	for linux-mtd@lists.infradead.org;
	Mon, 15 Sep 2025 18:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1757962756; x=1758567556; i=rwahl@gmx.de;
	bh=Ae340wb7eAdmX+EKTshm3ca14Cs/ssBoOM9liKBOu6U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PAkCIu6gx8OG1KemEO4rqtyw/EfaFhIIIJPzPnj8okITs/P89BJQi5ihipZGXZf+
	 Niy6hz4xmCWbCLNpXtxNhubFO7m95iiA7/CCj72vaxxeWM25ACkYcnJ30sO6mnO0v
	 70NmvyMVVvPWWmJYCBHUGxcoUGnOjYvhXIp5tuhWB4zjS1gKHQwuxEQZtLSI1L8xC
	 RKW7hRU14N7YgfhYaoUH1MVK1Drrv/A4LnOG71Mi1299+8q0Bzesx0CxMav8DNPsR
	 HgKxgcRqVYUuiPxGRxZUdR/rr8yYmvw2t/Xs1M2qP1QdRv4hEtJNaAPf2z9io9g/V
	 Ru3U630BL6hvAtNBnA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.24] ([84.156.135.187]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKu0-1un8d21sZU-00UgUK; Mon, 15
 Sep 2025 20:59:16 +0200
Message-ID: <75a3cd63-f64c-4bf0-b75a-e9e2d088b274@gmx.de>
Date: Mon, 15 Sep 2025 20:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Ronald Wahl <rwahl@gmx.de>
Subject: jffs2: directory rename and power-cut causes strange situation
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
X-Provags-ID: V03:K1:fa6uR1QkjIKBqQTmS4okON4YRlVg0sgdmfuzczszVNFi0k/UFo+
 iP8T26Hao1pqLzJbELpBqXrMbktkieC/CRKxn+WgIK0Kob+C45boQq0P2dWLz/0vJyE/y71
 TBnNT8PrkxYWiJBnwJF2ZMaXa9Lq6l08TKUDcBCxX4PUXcO4L548DdwqQHU335CwLiy9H+P
 vnHZcJdz0Z2314f2MaZjQ==
UI-OutboundReport: notjunk:1;M01:P0:CgLlNIXzFb4=;9piTrXqm/d53f210scvmKQ1uHfO +gNrRnUdGH9R4EkfYnsQ1w5XUglT1CphmA1HpLF47yd1P6zBQMMHsZpH9Ad+HzTRjnDUMaFEX Fi2fI7bO3xNJ3YxrlN1MybLjm8MFKT63ENwphcSuRvHDtBriv3aLt+SnilSup/GCJl0+2T2PA V90ABMqRtfMOMxeIgaUyboRll1mecKiqMKeJZAbgJtjAQNVxtoFd4v5ssG8h5p8NlrugXk6fX w+bb8NJj73XH/EoORrmw5Z8WZ21X+rRM1cJhnedjp55/WLG748S2NQevTIhNdFENTz78SGk11 JHGKCFKTduAEVMj4Q7MveL6maTaq7PuGB4RCeCaGiFedjTsTpsW/IFf6QsPOzAQ0gzuLN4q/8 ceV0RAFfx7CTqdE/l7C6J98Vfakf3cMH5J5EqKivm5JjPnZyIB4ZE6OkP0msmy7ZHzEGuJsLX UJhESq5pm7B6gk9KrIiCwMzlqYkyAjgNTWJtgnRUXOhp3WAin4/HmNPr5BYYZ9ad83ySrZp3v IM7W9UveXVpZJ0mSSrpn4gMHLVjKqZ2sV9wjGh17FHKHZ9rolFYvmgxRrqJikEudFojLPi1fg mTk6azlETgkBL/MV6kChbmcDAg5hBcqUizVrC46TCoYf1zXVdkoarV8UyWyMgSqLpOT1ULD2W x96EVSH4utOEuEKlazgef+f2YZCo16JQeU9Ga20XSJHVGZgK/KlEStGYyv+ZxpCiamdkWhSAO Of45xJnZIe4URXdwAD/y7JFNCMSZ/3XqOKpIPkaRJ7Pq0ifmSiI+nEZahFzgNIRb+AZZ19ZVu oBpNs3SO3vK0gujUg7M6L5hO1qLJ7pF7eAmFx2NGGhjrndaszfHf6A1BbjyXCS2RC59habgOQ KvX1pEazNeItPUB8BRTplXCv13na3XE1WGwpYBy4RqmITp9grkoUlqbZIjFc9fYkSDc2kKTPX zyj9fLo0lSJN2+xRCqgV59idHlBwLMcV9l8ZOIqwJmFJyr9S5zuadK0N0LPUTQZ95BJw6FC8j W85CLldOEZ0xbIVpVyZoOJlvvRXibNJChLww72OmSQM0J0MSHnbqJVZDQOLh7W8zFvH8K2QcB RRDDfaG6fcdQKEHKPltKsXtoBQR5B7M0ty+oOlw9hD0O1uCkxFxj63PTLine+bnk/lfNRTGXR vTF8jp700jxqBfUC0L/T4m7xLN/OUN7szVTuyVtLy1+Vp6zq3dyK4f8Xjw+LadKC47Ztbx6za YFur9HZzI6SIbZTM/atwDuyrIYzU2YnXSrWWmv97Cdwd9eEpyyf+LLMhoMsfErF8up1RVV+UL iK5+aF9+8c00DtqB13DRDA2HviVRwS9mnB5HteCFzFhNND4ln3poWmapu6TLJp5UM5brU4nOc QrPlZTXTqgGZdMasZhffnITLF1Stnlk3ruXqo07uzWpBqRt2non/HVfmRa8KVot6fOEajByed o8+maEnCH5pfwiLpIZTSVzBoZfrYNL7HFxgt18yE0TCEX/gikdf89HqzDEIYdCnuZJuAYcgIP EmhxI8nF1pp79+Dzz/HaU8W0HoI+S1CZdl5LpiO8qpAV2aGndMVHSHz46fUa8sDY0lSfHPGgx ceLxGziQmf0N9IgAQ9rcLG0LX7VsEaPQ93tfEo+GXp8JX0NuHXo9iE430H+JcoZz6941k7D/z Mo1AXyJ85YFuoojLgEDZ+G0KDW/LsZNKrYWxmOCYaY1MUFZhICNorp3REQYx1bMQb78sjjsAV 9KofKCV0WWQZIPgJ6+l1bVPjhtLK85UBuM72nZcosiocOYquHVIB1zerGNofqDHYU+CLlbN9h gfvzhlFds7tYcJ5/QUa5WPOqAHsxRA9W/u8hmkYWctQ7JtjC6phV22Hrw7Pvl/w6LS/hfDLWM wBqBR4wEtp+cmrTz0TqcYAcLqkwk3zCxocXECNrraXVXuzcIVSQwNEZpz9Q9EpdvqaN/CUl5c 55QuhJP3NKX2K4RtMTMzkmOCr+TGpGVnw9k7NlaBxrusTD1udFPYD8u+dkcSBIBrRe2I63dPe EZSOBUWtG803kMgFRSkrwNQKIL+6k91kOxp0OmQcENRXtdrkuRBk4DnIDWm8MfcSybF17qjvY 6pnTqb2lbONbxm21VuqPSa5sdyu85IckGNkAdbnc0q40PgJfwHYvu8g0/kWiEYz3hauBdnJ3N IFt6jk5QhneYhqkG/fGjI1bA3I+nrbCQTM+7pda4pyLKXLbz3M4Bv0IaAOhU1rvq8VZ3+JAeN wp1OPZl+kEy0nNaeb+OMZ0Au8dHCQS7VEMGnj9GY3CV4zi/cCiPfg1ahb8e5fbFfckFHWUESQ 88Uvkz0PSNd4RE0o4M0ww8ElOUCMhbUUp9BfnWbNWKPWvLa5PNKaplOUzCuJEw8Na3OsVS1d2 dkN42pSS9grxcdc3315TCtsELwA+msJPnu9WbkjaTwOv0hX/yG9Wy8/pj2ycRqW6R6iSZdyW8 KHDdLD7Blwd8C2zKVXlRHPj8a1PonXKS8LPAswEKrpTJ0kxaHej6aRDsNjut9Xls+M+l3TSd5 zgGN8usko5xO3R9qxGj1Mw3I9i4p03jrWi0adp2bwW9Ofc1pg53jT5w4m8/0cGFLE0Rx4hl2V drxpXk0OM4r6Cth8/RW5Q1qjBHBWmPrP4OPkcdDX2V2bNYB7iY8jCIHeN4OVLk2OYQ7eKtX2g TEy+4ENfkGiOcDPOMYfoyfwgpk+jczFd4oGx8vGy+FQYrO+VOKUd4yS3IeMONz+yVanr6dgx7 DpYg73hvuxFwWusRvO8TkzCVotx5Ckm1sWSH8InXn+x5Xh/u/qwGrGU3bGkcAcJFSK+7Rfl7N LvaDUwV9GyRMRRvexzQsQRTDBAmbP8dqHfzk0enruGzBk5ixF4+B0kHFd14lX2slWviJzENMR Laez8ljVWSRplNsAEJWhYNOmE4Pt3V85xKgck82yLLCmpMjJoGA++EC/Rgey/DUoFzJzLNhN+ W1t2nj65t1ESaPSjdW04j5KRtiC98mkwgz4ftjDGgvf9xiiDaNIeNVcW/xK0x02ftOjf51oSo Bu31kUZioZWWjlmD9mWDsTCyCV/PuWDRlpY8LkUfFXeCmBqvla9Z6Eu29Nm4UMSpjvt/7VTUb Tk2kx8FlCXFyTe0DWON75VoqUXKvp0KcLyPXSWc/LkrvMl4ZEbeBYSjRB5sviyomUT9toVXZi iWuBlZVkQN7xur6ERhrPSYVi4rAiQVxU9ZgGDCl3kET891iHrx78nnRz16h6WZzAlI6DAvmVg 5nEhuDOgR2PhgnvyAFvQMzxT+PXtvhSHZj1K9d6gtuUX0ij0ghxCFcMvfV0LnbBdhmtCui2XW 7yc/eoi6UlO236Aao3jlbbwnnAs6ZS+FiqelfNm39gfTpoHLXsFsKBfGu6HPDkhbLALKk0Bul EdW9jOGB2gIaXoEGLkg/jmHe+dwvMFSz9wfpJqnzbSWHf2+Xtw3wzzUrdB1VsMZHpwRWaF38s YH2WvKk+jy62rIMqrqdS+28yTSlPUL2os96ONId96OJUVkZbDV7r1vxW0pBS+9ObZQbhpluIO L1tB7x6xQsdfqJuI9WEGMoeiOMlcdpzJpii64sKfzELBYNAZyJ6F0UwYVq9tmhXrdnvZi8+Ad cKn1OS7LB03C9qWN+P2fhSBeAyKSCodebS8qq33zMA9cWcau/k/2WTDKmsPw7TqwFDszRTw64 Yz3GnEI5hvTdAo2RMpYq7ZU9dxgJMaPBRvD2Sm5WnY0mib1MwrMZR8t3uyGP4annerGYcNVZr pQLweJIOVvCLjjND7tQaYs3Q3J7kRlLqyyTtelMoEm9hSWtdv+pHt08SkRgqgAHz4Te97LNZ4 ho0FG/Vnmbinf80jlaLutL7KnckWWLbBDAJZfY0WjpRcFltMw3NdROai9D2NPLUyIYliyIEuN
 NqmWtxEua2PMCzu/tOiuNuvnJg96XTg+63AVRK/KIdcY/oekuaf6Wu6z3plFbGIoI+FMaSG93 1ddgM5YUailZf8S94HOcHnVJ072h+dnrr8D4qThDM7CeUb63YXTpTen8HbA78qdGlpFOOndm+ jc+adBaJfGM7uIGLI4Kzv0PP9gNoq5s0QO9DHKF+C1M/uTgatgArnunl4hNs8keLQG0sbZI5R M63pHenHczwAzvQMF3LgJCZ15TTkcqF9O30tsWxhdwz4+zY3K53hqLRyGGXvB7iCT9XDY4/as vL64MtYCSBSPhS4SV4Cmxm41a3dxiw76a5eNz/UpLaEriA15KLvUFNJvJrPp8xQ7pm2cQ8kvq VhZ4Q5mMwx+Bbct9eUmXrdavabE331cYKR8bzOtDVfs06dbNqDDQYlDhkwJuAQzoakPLHwFPU 6FsTTBlpsQvjr57Py/yXmvTmMOSBKTjJk22qTfTD6ZPfC5W8QuLej8RAeaId+alihpnTF9/SU MU6iURa2SzQ0hc8yU00Xj+0UHDbxfvIe7r8gC68EI4hyrnMz+amhOLOObm1U9oIvVDxCU3DFj JdG+pnduUKJn+aHIDCA5bNeBUDNAD3RLJTQ+jKEmq4CQEBCZY4CFC4/kTPwrPDpIMg/w4DKtr nVB5Zj2RP80Q3RR95LZPhfksCqolwieOQ+MhwBOoKRaR6P523SqHso6Jmrg8lMnoUW4diutSR 6vnJEMmVH0cqA1y59qOcz55G1Yjue7jOoHDIh95kARl/H33GKC9mKUUoy2exnvC0EC8fAmn9l +8RK5X7EdwvCkdmL4oqukGj/3QP7Ai4qnCz1lf+uQaqvUpIEkdKEbCmFtxnM48SSr3PMgSQ8s iqWfYU4QhqgjVeEBOaSb++S/ugLQjbyjAMCL9JIpflLIPNvgylSmuTnx12CAkU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_115934_140037_39459B1D 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I have experienced a strange behaviour on a jffs2 filesystem with a 
directory rename and power-cut. I have to admit that I have write 
buffering (and SUMMARY) enabled and it is a SPI-NOR flash with 
transparent ECC and a write buffer size of 16 bytes. Not sure if this 
matters but it makes the issue more reproducable I think. Kernel is 6.12.40.

Steps:
1. mkdir D
2. touch D/file
3. sync
4. mv D E
5. immediate power-cut
6. reboot and mount the filesystem

Observations:
1. Mounting will show some errors that might be expected:

    jffs2: jffs2_scan_dirent_node(): Name CRC failed on node at
      0x0007d81c: Read 0xffffffff, calculated 0x2d02ef8d
    jffs2: error: (575) jffs2_build_filesystem: child dir "D" (ino
      #20025) of dir ino #1 is also hard linked from dir ino #1

2. There are two directories D and E both referring to the same inode,
    i.e. a hardlink, which typically is not allowed to create with
    link() for good reasons

3. Removing one of the directories with "rm -rf D" will (not quite
    unexpected) and a subsequent "ls -l" cause jffs2 errors and ls fails:

    jffs2: warning: (1097) jffs2_get_inode_nodes: Eep. No valid nodes for
      ino #20025.
    jffs2: warning: (1097) jffs2_do_read_inode_internal: no data nodes
      found for ino #20025
    jffs2: iget() failed for ino #20025
    ls: ./E: Input/output error

So now the question is how to recover from this situation? Somehow 
hard-linked directories are something rather evil. Maybe this should be 
corrected during mount already?

Thx,
ron




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

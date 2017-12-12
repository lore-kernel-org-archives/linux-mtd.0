Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOp17-0004Uq-VV
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 18:10:59 +0000
Date: Tue, 12 Dec 2017 19:10:10 +0100
In-Reply-To: <20171212143512.3b62d3f5@xps13>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171207213814.4c57098f@xps13>
 <26441ab5-8c70-4d7f-5e0d-bec3d59e2ef2@prevas.dk>
 <20171208102148.0a2c0fbe@xps13>
 <e1f47fe9-9b05-fdcd-b7ed-10e8cbced3a4@prevas.dk>
 <20171211105359.7eb1aeb3@xps13>
 <d0dee517-8061-5d40-aa82-6d4c5cda4fb1@prevas.dk>
 <a2502de6-b4c7-befb-6a08-de976be85d17@prevas.dk>
 <f70d94b8-5fc7-d091-9a5c-77597d2b7aa4@prevas.dk>
 <20171211150200.51c7f3b4@xps13> <20171211150929.722a361a@xps13>
 <a5fc7dea-a043-370c-b18a-eeb8f1f067f4@prevas.dk>
 <20171212095119.475de032@xps13>
 <727489cf-d1f6-8777-c6f4-981127657c9d@prevas.dk>
 <20171212111227.4946cc15@xps13>
 <e9e6bf70-918f-b750-5893-55744dc34882@prevas.dk>
 <20171212120806.7c31463f@xps13>
 <a0267c71-4333-7dd4-dcf4-14aced37f8f9@prevas.dk>
 <20171212123523.48185f21@xps13>
 <75bd6b87-12ed-4003-262a-b1bd03a62cbd@prevas.dk>
 <20171212134706.49f3c57e@xps13>
 <2f16ce90-6e00-c95f-7a81-5603d9acf574@prevas.dk>
 <20171212143512.3b62d3f5@xps13>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
CC: ezequiel.garcia@free-electrons.com, linux-mtd@lists.infradead.org,
 "Kasper Revsbech (KREV)" <krev@triax.com>,
 Boris Brezillon <Boris.Brezillon@free-electrons.com>
From: =?ISO-8859-1?Q?Sean_Nyekj=E6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <48EEEC1C-954B-42E5-92BE-A00AD97A5789@prevas.dk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hi Miquel
>
>> Without kernel bbt (nand scrubbed in uboot just before boot):
>
>[=2E=2E=2E]
>
>> Block size 131072, page size 2048, OOB size 64
>> Dumping data starting at 0x0fec0000 and ending at 0x0fec0800=2E=2E=2E
>
>[=2E=2E=2E]
>
>>  =C2=A0 OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>  =C2=A0 OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>  =C2=A0 OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>  =C2=A0 OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>
>As you can see, your U-Boot version does not recreate the BBT
>automatically as I told you it should=2E Please try rebooting the board
>after scrubbing and then check U-Boot creates the BBT from U-Boot
>command line=2E

My uboot is recreating the bbt, I have been scrubbing it just before runni=
ng the bootcmd that's why the OOB is empty :-)
I thought that was what you needed but I guess I was wrong=2E

>
>I insist on the fact that this is something I could have spotted
>earlier
>if you had blindlessly copy/pasted the *entire* trace, I don't
>mind if it is big, it can be really interesting for others to get the
>full trace=2E
>
>This time I only need the trace without the "on-flash-bbt" property=2E

I see what you want now, you want me to dump what uboot is writing in the =
bbt and what the new driver is writing :-)
Correct?
I'm sending some tracing the first thing tomorrow=2E

/Sean
